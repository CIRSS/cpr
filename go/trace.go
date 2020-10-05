package cpr

import (
	"database/sql"
	"io"

	// load the SQLite3 sql driver
	"github.com/cirss/cpr/rdf"
	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskNonrepeatables      = true
	IgnoreFirstProcessFiles = true
	WorkingDirPathIndex     int64
)

type Trace struct {
	FirstProcess int64
	PathRoles    []PathRole
	Run          WorkflowRun
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
	trace.Run = NewWorkflowRun(runID, runName)

	trace.Executions = GetExecutions(db)
	trace.Arguments = GetArguments(trace.Executions)
	WorkingDirPathIndex, _ = PathIndex(trace.Executions[0].WorkingDir)

	trace.FileOpens = GetFileOpens(trace, db)
	trace.Accesses = GetAccessedPaths(trace.Executions, trace.FileOpens)

	return trace
}

func WriteTraceFacts(file io.Writer, trace Trace) {
	WriteProcessFacts(file, trace.Processes)
	WriteExecutionFacts(file, trace.Executions)
	WriteArgumentFacts(file, trace.Arguments)
	WriteFileOpenFacts(file, trace.FileOpens)
	WriteRunFacts(file, trace.Run)
	WritePathRoleFacts(file, trace.PathRoles)
	WriteAccessedPathFacts(file, trace.Accesses)
}

func GetTraceGraph(trace Trace) *rdf.Graph {

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
	AddRunTriples(graph, trace, trace.Run)
	AddPathRoleTriples(graph, trace.PathRoles)

	return graph
}
