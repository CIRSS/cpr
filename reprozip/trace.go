package reprozip

import (
	"fmt"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

func ExtractTrace(traceDir string) {

	db, err := sql.Open("sqlite3", traceDir + "/trace.sqlite3")
	if err != nil {
		fmt.Println(err)
		return
	}

	rows, err := db.Query("SELECT id, run_id, parent, timestamp, is_thread, exitcode FROM processes")
	if err != nil {
		fmt.Println(err)
		return
	}

	var p Process

	for rows.Next() {
		err = rows.Scan(&p.ID, &p.RunID, &p.Parent, &p.Timestamp, &p.IsThread, &p.ExitCode)
		fmt.Println(p.String())
	}
}