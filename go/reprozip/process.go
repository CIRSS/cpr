package reprozip

import (
	"fmt"
	"database/sql"
)

type Process struct {
 	ID int
	RunID int
	Parent sql.NullInt32
	Timestamp int64
	IsThread bool
	ExitCode int
}


func QueryProcesses(db *sql.DB) *sql.Rows {
	rows, err := db.Query("SELECT id, run_id, parent, timestamp, is_thread, exitcode FROM processes")
	if err != nil {
		panic(err)
	}
	return rows
}

func WriteProcessFacts(rows *sql.Rows) {
	var p Process
	for rows.Next() {
		err := rows.Scan(&p.ID, &p.RunID, &p.Parent, &p.Timestamp, &p.IsThread, &p.ExitCode)
		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Println(p.String())
	}
}

func (p *Process) String() string {
	return fmt.Sprintf("rpz_process(p%d, %s, r%d, %t, %d, %s).",
		p.ID, int32OrNil("p", p.Parent), p.RunID, p.IsThread, p.ExitCode, maskableInt64(p.Timestamp))
}
