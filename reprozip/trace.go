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

	rows, err := QueryProcesses(db)
	if err != nil {
		fmt.Println(err)
		return
	}
	WriteProcessFacts(rows)

	rows, err = QueryExecutions(db)
	if err != nil {
		fmt.Println(err)
		return
	}
	WriteExecutions(rows)

}