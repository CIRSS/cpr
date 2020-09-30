package prov

import (
	"database/sql"
	"fmt"
	"io"
)

// FileOpen represents a row in the opened_files table of trace.sqlite3
type FileOpen struct {
	OpenID      int64
	RunID       int64
	Name        string
	Timestamp   int64
	Mode        int64
	IsDirectory bool
	Process     int64
}

// GetFileOpens returns all rows in the opened_files table of trace.sqlite3
func GetFileOpens(db *sql.DB) []FileOpen {
	var opened []FileOpen
	rows, err := db.Query("SELECT id, run_id, name, timestamp, mode, is_directory, process FROM opened_files")
	if err != nil {
		panic(err)
	}
	for rows.Next() {
		var f FileOpen
		err := rows.Scan(&f.OpenID, &f.RunID, &f.Name, &f.Timestamp, &f.Mode, &f.IsDirectory, &f.Process)
		if err != nil {
			fmt.Println(err)
			return opened
		}
		if IgnoreFirstProcessFiles && f.Process == FirstProcessID {
			continue
		}

		path := TrimWorkingDirPrefix(f.Name)
		role := Role(path)
		if role != "nul" {
			opened = append(opened, f)
		}
	}
	return opened
}

func WriteFileOpenFacts(w io.Writer, opens []FileOpen) {
	printRowHeader(w, "rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).")
	for _, fo := range opens {
		fmt.Fprintln(w, fo)
	}
}

// String prints one row of the opened_files table of trace.sqlite3 as a Prolog fact
func (fo FileOpen) String() string {
	return fmt.Sprintf("rpz_file_open(%s, %s, %s, %s, %d, %t, %s).",
		O(fo.OpenID), R(fo.RunID), P(fo.Process), Q(fo.Name), fo.Mode, fo.IsDirectory, maskableInt64(fo.Timestamp))
}
