package reprozip

import (
	"strconv"
	"database/sql"
)

const (
	separator = "%---------------------------------------------------------------------------------------------------"
)

func printRowHeader(header string) {
	println()
	println(separator)
	println("% FACT:", header)
	println(separator)
}

func dq(s string) string {
	return "\"" + s + "\""
}

func int32OrNil(prefix string, i sql.NullInt32) string {
	if i.Valid {
		return prefix + strconv.FormatInt(int64(i.Int32), 32)
	}
	return "nil"
}

