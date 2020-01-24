package reprozip

import (
	"fmt"
	"database/sql"
)

type ExecutedFile struct {
	ID int
	Name string 
	RunID int
	Timestamp uint64
	Process int
	Argv string
	Envp string
	WorkingDir string
}

func QueryExecutedFiles(db *sql.DB) (*sql.Rows, error) {
	rows, err := db.Query("SELECT id, name, run_id, timestamp, process, argv, envp, workingdir FROM executed_files")
	return rows, err
}

func WriteExecutedFiles(rows *sql.Rows) {
	var f ExecutedFile
	for rows.Next() {
		err := rows.Scan(&f.ID, &f.Name, &f.RunID, &f.Timestamp, &f.Process, &f.Argv, &f.Envp, &f.WorkingDir)
		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Println(f.String())
	}
}

func dq(s string) string {
	return "\"" + s + "\""
}

func (f *ExecutedFile) String() string {
	return fmt.Sprintf("rz_executed_file(e%d, r%d, p%d, %s, %s, %s, %d).", 
		f.ID, f.RunID, f.Process, dq(f.Name), dq(f.Argv), dq(f.WorkingDir), f.Timestamp)
}