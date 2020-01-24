package reprozip

import (
	"database/sql"
)

func printRowHeader(header string) {
	println()
	println("%---------------------------------------------------------------------------------------------------")
	println("% FACT:", header)
	println("%---------------------------------------------------------------------------------------------------")
}

func dq(s string) string {
	return "\"" + s + "\""
}

func int32OrNil(prefix string, i sql.NullInt32) string {
	if i.Valid {
		return prefix + string(i.Int32)
	} else {
		return "nil"
	}
}

