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

func GetOpenedFiles(db *sql.DB) []OpenedFile {

	var ofs []OpenedFile

	rows, err := db.Query("SELECT id, run_id, name, timestamp, mode, is_directory, process FROM opened_files")
	if err != nil {
		panic(err)
	}

	for rows.Next() {

		var f OpenedFile

		err := rows.Scan(&f.ID, &f.RunID, &f.Name, &f.Timestamp, &f.Mode, &f.IsDirectory, &f.Process)
		if err != nil {
			fmt.Println(err)
			return ofs
		}

		if IgnoreFirstProcessFiles && f.Process == FirstProcessID {
			continue
		}

		ofs = append(ofs, f)
	}

	return ofs
}

func (f *OpenedFile) String() string {
	return fmt.Sprintf("rpz_opened_file(f%d, r%d, p%d, %s, %d, %t, %s).",
		f.ID, f.RunID, f.Process, dq(f.Name), f.Mode, f.IsDirectory, maskableInt64(f.Timestamp))
}
