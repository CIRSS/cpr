package reprozip

import (
	"database/sql"
	"fmt"
)

// Process represents a row in the processes table of trace.sqlite3
type Process struct {
	ID        int64
	RunID     int64
	Parent    sql.NullInt64
	Timestamp int64
	IsThread  bool
	ExitCode  int64
}

// GetProcesses returns all rows in the processes table of trace.sqlite3
func GetProcesses(db *sql.DB) []Process {

	var ps []Process

	rows, err := db.Query("SELECT id, run_id, parent, timestamp, is_thread, exitcode FROM processes")
	if err != nil {
		panic(err)
	}

	for rows.Next() {
		var p Process
		err := rows.Scan(&p.ID, &p.RunID, &p.Parent, &p.Timestamp, &p.IsThread, &p.ExitCode)
		if err != nil {
			fmt.Println(err)
			return ps
		}
		ps = append(ps, p)
	}

	return ps
}

// String prints one row of the processes table of trace.sqlite3 as a Prolog fact
func (p *Process) String() string {
	return fmt.Sprintf("rpz_process(%s, %s, %s, %t, %d, %s).",
		P(p.ID), int64OrNil("p", p.Parent), R(p.RunID), p.IsThread, p.ExitCode, maskableInt64(p.Timestamp))
}
