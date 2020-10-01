package cpr

import (
	"database/sql"
	"fmt"
	"io"

	"github.com/cirss/cpr/rdf"
)

// Execution represents a row in the executed_files table of trace.sqlite3
type Execution struct {
	ExecID     int64
	Name       string
	RunID      int64
	Timestamp  int64
	Process    int64
	Argv       string
	Envp       string
	WorkingDir string
}

// GetExecutions returns all rows in the executed_files table of trace.sqlite3
func GetExecutions(db *sql.DB) []Execution {
	var executed []Execution
	rows, err := db.Query("SELECT id, name, run_id, timestamp, process, argv, envp, workingdir FROM executed_files")
	if err != nil {
		panic(err)
	}
	for rows.Next() {
		var f Execution
		err := rows.Scan(&f.ExecID, &f.Name, &f.RunID, &f.Timestamp, &f.Process, &f.Argv, &f.Envp, &f.WorkingDir)
		if err != nil {
			fmt.Println(err)
			return executed
		}
		executed = append(executed, f)
	}
	return executed
}

func WriteExecutionFacts(w io.Writer, executed []Execution) {
	printRowHeader(w, "cpr_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).")
	for _, f := range executed {
		fmt.Fprintln(w, f)
	}
}

// String prints one row of the executed_files table of trace.sqlite3 as a Prolog fact
func (f Execution) String() string {
	return fmt.Sprintf("cpr_execution(%s, %s, %s, %s, %s, %s).",
		E(f.ExecID), R(f.RunID), P(f.Process), Q(f.Name), Q(f.WorkingDir), maskableInt64(f.Timestamp))
}

func AddExecutionTriples(g *rdf.Graph, executions []Execution) {
	for _, e := range executions {
		executionURI := ExecutionUri(g, e.ExecID)
		g.AddNewTriple(executionURI, "rdf:type", g.NewUri("cpr:Exec"))
		g.AddNewTriple(executionURI, "cpr:ExecProcess", ProcessUri(g, e.Process))
		g.AddNewTriple(executionURI, "cpr:ExecFile", e.Name)
		g.AddNewTriple(executionURI, "cpr:ExecDir", e.WorkingDir)
		g.AddNewTriple(executionURI, "cpr:ExecStart", e.Timestamp)
	}
}

func ExecutionUri(g *rdf.Graph, id int64) rdf.Uri {
	return g.NewUri(fmt.Sprintf("run:exec/%d", id))
}
