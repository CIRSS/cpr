package rpz

import (
	"database/sql"
	"fmt"
	"io"

	"github.com/cirss/cpr/pkg/cpr"
	"github.com/cirss/geist/pkg/rdf"
	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskTimestamps          = true
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

func ExtractTrace(runName string, traceDir string, config cpr.Config) Trace {

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
	graph.Base = RunBaseUri(graph, trace.Run)

	graph.AddNewPrefix("cpr", "http://cirss.illinois.edu/ns/cpr#")
	graph.AddNewPrefix("os", "http://cirss.illinois.edu/ns/cpr/os#")
	graph.AddNewPrefix("wt", "http://cirss.illinois.edu/ns/cpr/wt#")
	graph.AddNewPrefix("rdf", "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
	graph.AddNewPrefix("rdfs", "http://www.w3.org/2000/01/rdf-schema#")

	AddRunTriples(graph, trace, trace.Run)
	AddProcessTriples(graph, trace.Processes)
	AddExecutionTriples(graph, trace.Executions)
	AddArgumentTriples(graph, trace.Arguments)
	AddFileOpenTriples(graph, trace.FileOpens)
	AddAccessedPathTriples(graph, trace.Accesses)
	AddPathRoleTriples(graph, trace.PathRoles)

	return graph
}

func RunBaseUri(g *rdf.Graph, run WorkflowRun) rdf.Uri {
	return g.NewUri(fmt.Sprintf("http://cirss.illinois.edu/runs/%d/", run.RunID))
}
