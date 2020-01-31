package reprozip

import (
	"fmt"
	"database/sql"
)

type ExecutedFile struct {
	ID int
	Name string
	RunID int
	Timestamp int64
	Process int32
	Argv string
	Envp string
	WorkingDir string
}

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


func (f *ExecutedFile) String() string {
	return fmt.Sprintf("rpz_executed_file(e%d, r%d, p%d, %s, %s, %s, %s).",
		f.ID, f.RunID, f.Process, dq(f.Name), dq(f.Argv), dq(f.WorkingDir), maskableInt64(f.Timestamp))
}
