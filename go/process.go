package cpr

import (
	"database/sql"
	"fmt"
	"io"

	"github.com/cirss/cpr/rdf"
)

// Process represents a row in the processes table of trace.sqlite3
type Process struct {
	ID        int64
	RunID     int64
	Parent    sql.NullInt64
	Timestamp int64
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
	printRowHeader(writer, "cpr_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	for _, p := range processes {
		fmt.Fprintln(writer, p)
	}
}

// String prints one row of the processes table of trace.sqlite3 as a Prolog fact
func (p Process) String() string {
	return fmt.Sprintf("cpr_process(%s, %s, %s, %t, %d, %s).",
		P(p.ID), int64OrNil("p", p.Parent), R(p.RunID), p.IsThread, p.ExitCode, maskableInt64(p.Timestamp))
}

func AddProcessTriples(g *rdf.Graph, processes []Process) {
	for _, p := range processes {
		processURI := ProcessUri(p.ID)
		if p.IsThread {
			g.AddNewTriple(processURI, "rdf:type", "cpr:Thread")
		} else {
			g.AddNewTriple(processURI, "rdf:type", "cpr:Process")
		}
		if p.Parent.Valid {
			g.AddNewTriple(processURI, "cpr:ChildOf", ProcessUri(p.Parent.Int64))
		}
		g.AddNewTriple(processURI, "cpr:ExitCode", p.ExitCode)
		g.AddNewTriple(processURI, "cpr:StartTime", p.Timestamp)
	}
}

func ProcessUri(id int64) string {
	return fmt.Sprintf("run:process/%d", id)
}
