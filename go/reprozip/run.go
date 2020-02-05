package reprozip

import (
	"fmt"
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

func (r Run) String() string {
	return fmt.Sprintf("rpz_run(%s, %s).",
		R(r.RunID), Q(r.RunName))
}
