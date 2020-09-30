package cpr

import (
	"fmt"
	"io"
	"strconv"
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
