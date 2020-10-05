package cpr

import (
	"fmt"
	"io"
	"strconv"

	"github.com/cirss/cpr/rdf"
)

type Run struct {
	RunID   int64
	RunName string
}

func NewRun(runId int64, runName string) Run {
	if runName == "" {
		runName = "run" + strconv.FormatInt(runId, 10)
	}
	return Run{runId, runName}
}

func WriteRunFacts(writer io.Writer, run Run) {
	printRowHeader(writer, "cpr_run(RunID, RunName).")
	fmt.Fprintln(writer, run)
}

func (r Run) String() string {
	return fmt.Sprintf("cpr_run(%s, %s).",
		R(r.RunID), Q(r.RunName))
}

func AddRunTriples(g *rdf.Graph, trace Trace, run Run) {
	runURI := RunUri(g, run.RunID)
	g.AddNewTriple(runURI, "rdf:type", g.NewUri("cpr:Run"))
	g.AddNewTriple(runURI, "cpr:RunName", run.RunName)
	g.AddNewTriple(runURI, "cpr:FirstProcess", ProcessUri(g, trace.FirstProcess))
}

func RunUri(g *rdf.Graph, runID int64) rdf.Uri {
	return g.NewUri(fmt.Sprintf("wfv:run/%d", runID))
}
