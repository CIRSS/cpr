package reprozip

import (
	"fmt"
	"database/sql"
)

type OpenedFile struct {
	ID int
	RunID int
	Name string 
	Timestamp uint64
	Mode int
	IsDirectory bool
	Process int
}

func QueryOpenedFiles(db *sql.DB) (*sql.Rows, error) {
	rows, err := db.Query("SELECT id, run_id, name, timestamp, mode, is_directory, process FROM opened_files")
	return rows, err
}

func WriteOpenedFiles(rows *sql.Rows) {
	var f OpenedFile
	for rows.Next() {
		err := rows.Scan(&f.ID, &f.RunID, &f.Name, &f.Timestamp, &f.Mode, &f.IsDirectory, &f.Process)
		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Println(f.String())
	}
}

func (f *OpenedFile) String() string {
	return fmt.Sprintf("rz_opened_file(f%d, r%d, %s, %d, %d, %t, p%d).", 
		f.ID, f.RunID, dq(f.Name), f.Timestamp, f.Mode, f.IsDirectory, f.Process)
}