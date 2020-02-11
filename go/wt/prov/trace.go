package prov

import (
	"database/sql"
	"os"

	// load the SQLite3 sql driver
	_ "github.com/mattn/go-sqlite3"
)

var (
	RPZFactsFile            = os.Stdout
	WTFactsFile             = os.Stdout
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

	opened := GetOpenedFiles(db)
	accessed := GetAccessedPaths(executions, opened)

	WriteProcessFacts(RPZFactsFile, processes)
	WriteExecutionFacts(RPZFactsFile, executions)
	WriteArgumentFacts(RPZFactsFile, arguments)
	WriteOpenedFacts(RPZFactsFile, opened)

	WriteRunFacts(WTFactsFile, run)
	WritePathRoleFacts(WTFactsFile, pathRoles)
	WriteAccessedPathFacts(WTFactsFile, accessed)
}
