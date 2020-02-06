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

func ExtractTrace(runName string, traceDir string, config Config) {

	db, err := sql.Open("sqlite3", traceDir+"/trace.sqlite3")
	if err != nil {
		panic(err)
	}

	processes := GetProcesses(db)
	firstProcess := processes[0]
	FirstProcessID = firstProcess.ID
	runID := firstProcess.RunID

	directories := GetDirectories(config, runID)

	run := NewRun(runID, runName)
	printRowHeader("wt_run(RunID, RunName).")
	fmt.Println(run)

	printRowHeader("rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).")
	for _, p := range processes {
		fmt.Println(p)
	}

	executed := GetExecutedFiles(db)
	WorkingDirFileIndex, _ = Index(executed[0].WorkingDir)
	printRowHeader("rpz_executed(ExecutionID, RunID, ProcessID, FilePath, Argv, WorkingDir, TimeStamp).")
	for _, f := range executed {
		fmt.Println(f)
	}

	opened := GetOpenedFiles(db)
	printRowHeader("rpz_opened(FileID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).")
	for _, f := range opened {
		fmt.Println(f)
	}

	accessed := GetAccessedFiles(executed, opened)
	printRowHeader("wt_accessed(ID, FilePath, FileIndex).")
	for _, f := range accessed {
		fmt.Println(f)
	}

	printRowHeader("wt_directory(DirID, RunID, DirType, FilePath, FileIndex).")
	for _, d := range directories {
		fmt.Println(d)
	}

}
