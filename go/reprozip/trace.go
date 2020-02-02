package reprozip

import (
	"database/sql"
	"fmt"

	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskNonrepeatables      = true
	IgnoreFirstProcessFiles = true
	FirstProcessID          int32
	WorkingDirFileIndex     int
)

func ExtractTrace(traceDir string) {

	db, err := sql.Open("sqlite3", traceDir+"/trace.sqlite3")
	if err != nil {
		fmt.Println(err)
		return
	}

	processes := GetProcesses(db)
	FirstProcessID = processes[0].ID

	executed := GetExecutedFiles(db)
	opened := GetOpenedFiles(db)

	accessed := GetAccessedFiles(executed, opened)

	printRowHeader("rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	for _, p := range processes {
		fmt.Println(p.String())
	}

	printRowHeader("rpz_executed_file(ExecutionID, RunID, ProcessID, FileIndex, FilePath, Argv, WorkingDir, TimeStamp).")
	for _, f := range executed {
		fmt.Println(f.String())
	}

	printRowHeader("rpz_opened_file(FileID, RunID, ProcessID, FileIndex, FilePath, Mode, IsDirectory, Timestamp).")
	for _, f := range opened {
		fmt.Println(f.String())
	}

	printRowHeader("rpz_accessed_file(ID, FilePath, FileIndex).")
	for _, f := range accessed {
		fmt.Println(f.String())
	}
}
