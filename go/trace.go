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
	TraceStore              = ""
	MaskNonrepeatables      = true
	IgnoreFirstProcessFiles = true
	WorkingDirPathIndex     int64
)

type Trace struct {
	FirstProcess int64
	PathRoles    []PathRole
	Processes    []Process
	Executions   []Execution
	Arguments    []Argument
	FileOpens    []FileOpen
	Accesses     []AccessedPath
}

func ExtractTrace(runName string, traceDir string, config Config) Trace {

	var trace Trace

	db, err := sql.Open("sqlite3", traceDir+"/trace.sqlite3")
	if err != nil {
		panic(err)
	}

	trace.Processes = GetProcesses(db)
	trace.FirstProcess = trace.Processes[0].ID

	runID := int64(0)
	trace.PathRoles = GetPathRoleFacts(config, runID)
	run := NewRun(runID, runName)

	trace.Executions = GetExecutions(db)
	trace.Arguments = GetArguments(trace.Executions)
	WorkingDirPathIndex, _ = PathIndex(trace.Executions[0].WorkingDir)

	trace.FileOpens = GetFileOpens(trace, db)
	trace.Accesses = GetAccessedPaths(trace.Executions, trace.FileOpens)

	if len(TraceStore) == 0 {

		switch TraceFormat {

		case "facts":
			WriteProcessFacts(TraceFile, trace.Processes)
			WriteExecutionFacts(TraceFile, trace.Executions)
			WriteArgumentFacts(TraceFile, trace.Arguments)
			WriteFileOpenFacts(TraceFile, trace.FileOpens)
			WriteRunFacts(TraceFile, run)
			WritePathRoleFacts(TraceFile, trace.PathRoles)
			WriteAccessedPathFacts(TraceFile, trace.Accesses)
		case "triples":
			graph := rdf.NewGraph()
			graph.AddNewPrefix("cpr", "http://cirss.illinois.edu/ns/cpr#")
			graph.AddNewPrefix("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
			graph.AddNewPrefix("rdfs", "http://www.w3.org/2000/01/rdf-schema#")
			graph.AddNewPrefix("wf", "http://cirss.illinois.edu//workflow/3022#")
			graph.AddNewPrefix("wfv", "http://cirss.illinois.edu/workflow/3022/version/97#")
			graph.AddNewPrefix("run", "http://cirss.illinois.edu/workflow/3022/version/97/run/0#")
			AddProcessTriples(graph, trace.Processes)
			AddExecutionTriples(graph, trace.Executions)
			AddArgumentTriples(graph, trace.Arguments)
			AddFileOpenTriples(graph, trace.FileOpens)
			AddRunTriples(graph, trace, run)
			AddPathRoleTriples(graph, trace.PathRoles)
			io.WriteString(TraceFile, graph.String())
		}
	} else {

	}
	return trace
}
