package cpr

import (
	"database/sql"
	"io"
	"os"

	// load the SQLite3 sql driver
	"github.com/cirss/cpr/rdf"
	_ "github.com/mattn/go-sqlite3"
)

var (
	TraceFile               = os.Stdout
	TraceFormat             = "facts"
	MaskNonrepeatables      = true
	IgnoreFirstProcessFiles = true
	FirstProcessID          int64
	WorkingDirPathIndex     int64
)

func ExtractTrace(runName string, traceDir string, config Config) {

	db, err := sql.Open("sqlite3", traceDir+"/trace.sqlite3")
	if err != nil {
		panic(err)
	}

	processes := GetProcesses(db)
	firstProcess := processes[0]
	FirstProcessID = firstProcess.ID
	runID := firstProcess.RunID

	pathRoles := GetPathRoleFacts(config, runID)
	run := NewRun(runID, runName)

	executions := GetExecutions(db)
	arguments := GetArguments(executions)
	WorkingDirPathIndex, _ = PathIndex(executions[0].WorkingDir)

	opens := GetFileOpens(db)
	accessed := GetAccessedPaths(executions, opens)

	switch TraceFormat {

	case "facts":
		WriteProcessFacts(TraceFile, processes)
		WriteExecutionFacts(TraceFile, executions)
		WriteArgumentFacts(TraceFile, arguments)
		WriteFileOpenFacts(TraceFile, opens)
		WriteRunFacts(TraceFile, run)
		WritePathRoleFacts(TraceFile, pathRoles)
		WriteAccessedPathFacts(TraceFile, accessed)
	case "triples":
		graph := rdf.NewGraph()
		graph.AddNewPrefix("cpr", "http://cirss.illinois.edu/ns/cpr#")
		graph.AddNewPrefix("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
		graph.AddNewPrefix("rdfs", "http://www.w3.org/2000/01/rdf-schema#")
		graph.AddNewPrefix("run", "http://cirss.illinois.edu/ns/cpr#")
		AddProcessTriples(graph, processes)
		AddExecutionTriples(graph, executions)
		io.WriteString(TraceFile, graph.String())
	}
}
