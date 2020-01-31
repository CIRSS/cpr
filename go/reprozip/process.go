package reprozip

import (
	"fmt"
	"database/sql"
)

type Process struct {
 	ID int32
	RunID int
	Parent sql.NullInt32
	Timestamp int64
	IsThread bool
	ExitCode int
}

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

func (p *Process) String() string {
	return fmt.Sprintf("rpz_process(p%d, %s, r%d, %t, %d, %s).",
		p.ID, int32OrNil("p", p.Parent), p.RunID, p.IsThread, p.ExitCode, maskableInt64(p.Timestamp))
}
