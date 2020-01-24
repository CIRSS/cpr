package reprozip

import (
	"fmt"
	"database/sql"
)

type Execution struct {
	ID int
	Name string 
	RunID int
	Timestamp uint64
	Process int
	Argv string
	Envp string
	WorkingDir string
}

func QueryExecutions(db *sql.DB) (*sql.Rows, error) {
	rows, err := db.Query("SELECT id, name, run_id, timestamp, process, argv, envp, workingdir FROM executed_files")
	return rows, err
}

func WriteExecutions(rows *sql.Rows) {
	var ef Execution
	for rows.Next() {
		err := rows.Scan(&ef.ID, &ef.Name, &ef.RunID, &ef.Timestamp, &ef.Process, &ef.Argv, &ef.Envp, &ef.WorkingDir)
		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Println(ef.String())
	}
}

func dq(s string) string {
	return "\"" + s + "\""
}

func (ef *Execution) String() string {
	return fmt.Sprintf("rz_execution(e%d, %s, r%d, %d, p%d, %s, %s).", 
		ef.ID, dq(ef.Name), ef.RunID, ef.Timestamp, ef.Process, dq(ef.Argv), /* ef.Envp, */ dq(ef.WorkingDir))
}