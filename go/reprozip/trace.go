package reprozip

import (
	"fmt"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

var (
	MaskNonrepeatables=true
	ZeroOffsetProcessIDs=true
)

func ExtractTrace(traceDir string) {

	db, err := sql.Open("sqlite3", traceDir + "/trace.sqlite3")
	if err != nil {
		fmt.Println(err)
		return
	}

	printRowHeader("rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	ps := QueryProcesses(db)
	WriteProcessFacts(ps)

	printRowHeader("rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).")
	es := QueryExecutedFiles(db)
	WriteExecutedFiles(es)

	printRowHeader("rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).")
	fs := QueryOpenedFiles(db)
	WriteOpenedFiles(fs)
}
