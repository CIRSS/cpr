package cpr

import (
	"database/sql"
	"os"

	// load the SQLite3 sql driver
	_ "github.com/mattn/go-sqlite3"
)

var (
	TraceFile               = os.Stdout
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

	WriteProcessFacts(TraceFile, processes)
	WriteExecutionFacts(TraceFile, executions)
	WriteArgumentFacts(TraceFile, arguments)
	WriteFileOpenFacts(TraceFile, opens)

	WriteRunFacts(TraceFile, run)
	WritePathRoleFacts(TraceFile, pathRoles)
	WriteAccessedPathFacts(TraceFile, accessed)
}
