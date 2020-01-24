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

	ps := QueryProcesses(db)
	WriteProcessFacts(ps)

	es := QueryExecutedFiles(db)
	WriteExecutedFiles(es)

	fs := QueryOpenedFiles(db)
	WriteOpenedFiles(fs)
}