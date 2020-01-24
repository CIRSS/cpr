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

func QueryProcesses(db *sql.DB) (*sql.Rows, error) {
	rows, err := db.Query("SELECT id, run_id, parent, timestamp, is_thread, exitcode FROM processes")
	return rows, err
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

func Int32OrNil(prefix string, i sql.NullInt32) string {
	if i.Valid {
		return prefix + string(i.Int32)
	} else {
		return "nil"
	}
}

func (p *Process) String() string {
	return fmt.Sprintf("rz_process(p%d, r%d, %s, %d, %t, %d).", 
		p.ID, p.RunID, Int32OrNil("p", p.Parent), p.Timestamp, p.IsThread, p.ExitCode)
}