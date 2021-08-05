package rpz

import (
	"database/sql"
	"fmt"
	"io"

	"github.com/cirss/cpr/pkg/cpr"
	"github.com/cirss/geist/pkg/rdf"
)

// Process represents a row in the processes table of trace.sqlite3
type Process struct {
	ID        int64
	RunID     int64
	Parent    sql.NullInt64
	Timestamp uint64
	IsThread  bool
	ExitCode  int64
}

// GetProcesses returns all rows in the processes table of trace.sqlite3
func GetProcesses(db *sql.DB) []Process {
	var processes []Process
	rows, err := db.Query("SELECT id, run_id, parent, timestamp, is_thread, exitcode FROM processes")
	if err != nil {
		panic(err)
	}
	for rows.Next() {
		var p Process
		err := rows.Scan(&p.ID, &p.RunID, &p.Parent, &p.Timestamp, &p.IsThread, &p.ExitCode)
		if err != nil {
			fmt.Println(err)
			return processes
		}
		processes = append(processes, p)
	}
	return processes
}

func WriteProcessFacts(writer io.Writer, processes []Process) {
	cpr.PrintRowHeader(writer, "cpr_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	for _, p := range processes {
		fmt.Fprintln(writer, p)
	}
}

// String prints one row of the processes table of trace.sqlite3 as a Prolog fact
func (p Process) String() string {
	return fmt.Sprintf("cpr_process(%s, %s, %s, %t, %#v, %s).",
		P(p.ID), cpr.Int64OrNil("p", p.Parent), cpr.R(p.RunID), p.IsThread, p.ExitCode, cpr.TimestampUint64(p.Timestamp))
}

func AddProcessTriples(g *rdf.Graph, processes []Process) {
	for _, p := range processes {
		processURI := ProcessUri(g, p.ID)
		if p.IsThread {
			continue
			//g.AddNewTriple(processURI, "rdf:type", g.NewUri("cpr:Thread"))
		} else {
			g.AddNewTriple(processURI, "rdf:type", g.NewUri("os:Process"))
			g.AddNewTriple(processURI, "os:exitCode", p.ExitCode)
		}
		if p.Parent.Valid {
			g.AddNewTriple(processURI, "os:childProcessOf", ProcessUri(g, p.Parent.Int64))
		}
		g.AddNewTriple(processURI, "os:startTime", cpr.TimestampUint64(p.Timestamp))
	}
}

func ProcessUri(g *rdf.Graph, id int64) rdf.Uri {
	return g.NewUri(fmt.Sprintf("process/%d", id))
}

func P(id int64) string {
	return cpr.Prepend("p", id)
}
