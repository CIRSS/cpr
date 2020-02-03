package reprozip

import (
	"database/sql"
	"fmt"

	// load the SQLite3 sql driver
	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskNonrepeatables      = true
	IgnoreFirstProcessFiles = true
	FirstProcessID          int64
	WorkingDirFileIndex     int64
)

func ExtractTrace(traceDir string) {

	db, err := sql.Open("sqlite3", traceDir+"/trace.sqlite3")
	if err != nil {
		panic(err)
	}

	processes := GetProcesses(db)
	FirstProcessID = processes[0].ID
	printRowHeader("rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	for _, p := range processes {
		fmt.Println(p)
	}

	executed := GetExecutedFiles(db)
	WorkingDirFileIndex, _ = Index(executed[0].WorkingDir)
	printRowHeader("rpz_executed(ExecutionID, RunID, ProcessID, FileIndex, FilePath, Argv, WorkingDir, TimeStamp).")
	for _, f := range executed {
		fmt.Println(f)
	}

	opened := GetOpenedFiles(db)
	printRowHeader("rpz_opened(FileID, RunID, ProcessID, FileIndex, FilePath, Mode, IsDirectory, Timestamp).")
	for _, f := range opened {
		fmt.Println(f)
	}

	accessed := GetAccessedFiles(executed, opened)
	printRowHeader("rpz_accessed(ID, FilePath, FileIndex).")
	for _, f := range accessed {
		fmt.Println(f)
	}
}
