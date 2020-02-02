package reprozip

import (
	"database/sql"
	"fmt"
)

// ExecutedFile represents a row in the executed_files table of trace.sqlite3
type ExecutedFile struct {
	ID         int64
	Name       string
	RunID      int64
	Timestamp  int64
	Process    int64
	Argv       string
	Envp       string
	WorkingDir string
}

// GetExecutedFiles returns all rows in the executed_files table of trace.sqlite3
func GetExecutedFiles(db *sql.DB) []ExecutedFile {

	var efs []ExecutedFile

	rows, err := db.Query("SELECT id, name, run_id, timestamp, process, argv, envp, workingdir FROM executed_files")
	if err != nil {
		panic(err)
	}

	for rows.Next() {

		var f ExecutedFile

		err := rows.Scan(&f.ID, &f.Name, &f.RunID, &f.Timestamp, &f.Process, &f.Argv, &f.Envp, &f.WorkingDir)
		if err != nil {
			fmt.Println(err)
			return efs
		}

		efs = append(efs, f)
	}

	return efs
}

// String prints one row of the executed_files table of trace.sqlite3 as a Prolog fact
func (f *ExecutedFile) String() string {
	return fmt.Sprintf("rpz_executed_file(%s, %s, %s, %s, %s, %s, %s).",
		E(f.ID), R(f.RunID), P(f.Process), dq(f.Name), dq(f.Argv), dq(f.WorkingDir), maskableInt64(f.Timestamp))
}
