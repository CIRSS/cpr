package reprozip

import (
	"fmt"
	"database/sql"
)

type OpenedFile struct {
	ID int
	RunID int
	Name string
	Timestamp int64
	Mode int
	IsDirectory bool
	Process int32
}

func QueryOpenedFiles(db *sql.DB) *sql.Rows {
	rows, err := db.Query("SELECT id, run_id, name, timestamp, mode, is_directory, process FROM opened_files")
	if err != nil {
		panic(err)
	}
	return rows
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
	return fmt.Sprintf("rpz_opened_file(f%d, r%d, p%d, %s, %d, %t, %s).",
		f.ID, f.RunID, processId(f.Process), dq(f.Name), f.Mode, f.IsDirectory, maskableInt64(f.Timestamp))
}
