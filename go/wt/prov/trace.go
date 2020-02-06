package prov

import (
	"database/sql"
	"os"

	// load the SQLite3 sql driver
	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskNonrepeatables      = true
	IgnoreFirstProcessFiles = true
	FirstProcessID          int64
	WorkingDirFileIndex     int64
)

func ExtractTrace(runName string, traceDir string, config Config) {

	db, err := sql.Open("sqlite3", traceDir+"/trace.sqlite3")
	if err != nil {
		panic(err)
	}

	rpzFactsFile := os.Stdout
	wtFactsFile := os.Stdout

	processes := GetProcesses(db)
	firstProcess := processes[0]
	FirstProcessID = firstProcess.ID
	runID := firstProcess.RunID

	directories := GetDirectories(config, runID)
	run := NewRun(runID, runName)

	executed := GetExecutedFiles(db)
	WorkingDirFileIndex, _ = Index(executed[0].WorkingDir)

	opened := GetOpenedFiles(db)
	accessed := GetAccessedFiles(executed, opened)

	WriteProcessFacts(rpzFactsFile, processes)
	WriteExecutedFacts(rpzFactsFile, executed)
	WriteOpenedFacts(rpzFactsFile, opened)

	WriteRunFacts(wtFactsFile, run)
	WriteAccessedFacts(wtFactsFile, accessed)
	WriteDirectoryFacts(wtFactsFile, directories)
}
