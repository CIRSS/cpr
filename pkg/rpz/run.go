package rpz

import (
	"fmt"
	"io"
	"strconv"

	"github.com/cirss/geist/pkg/rdf"
)

type WorkflowRun struct {
	RunID   int64
	RunName string
}

func NewWorkflowRun(runId int64, runName string) WorkflowRun {
	if runName == "" {
		runName = "run" + strconv.FormatInt(runId, 10)
	}
	return WorkflowRun{runId, runName}
}

func WriteRunFacts(writer io.Writer, run WorkflowRun) {
	printRowHeader(writer, "cpr_run(RunID, RunName).")
	fmt.Fprintln(writer, run)
}

func (r WorkflowRun) String() string {
	return fmt.Sprintf("cpr_run(%s, %s).",
		R(r.RunID), Q(r.RunName))
}

func AddRunTriples(g *rdf.Graph, trace Trace, run WorkflowRun) {
	runUri := g.NewUri("")
	g.AddNewTriple(runUri, "rdf:type", g.NewUri("cpr:Run"))
	g.AddNewTriple(runUri, "cpr:RunName", run.RunName)
	g.AddNewTriple(runUri, "cpr:FirstProcess", ProcessUri(g, trace.FirstProcess))
}
