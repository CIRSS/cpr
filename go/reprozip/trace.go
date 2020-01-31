package reprozip

import (
	"fmt"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskNonrepeatables=true
	IgnoreFirstProcessFiles=true
	FirstProcessID int32
)

func ExtractTrace(traceDir string) {

	db, err := sql.Open("sqlite3", traceDir + "/trace.sqlite3")
	if err != nil {
		fmt.Println(err)
		return
	}

	processes := GetProcesses(db)
	FirstProcessID = processes[0].ID

	executedFiles := GetExecutedFiles(db)
	openedFiles := GetOpenedFiles(db)


	printRowHeader("rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	for _, p := range(processes) {
		fmt.Println(p.String())
	}

	printRowHeader("rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).")
	for _, f := range(executedFiles) {
		fmt.Println(f.String())
	}

	printRowHeader("rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).")
	for _, f := range(openedFiles) {
		fmt.Println(f.String())
	}
}
