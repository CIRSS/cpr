package reprozip

import (
	"database/sql"
	"fmt"
	"strconv"
)

const (
	separator = "%---------------------------------------------------------------------------------------------------"
)

func printRowHeader(header string) {
	fmt.Println()
	fmt.Println(separator)
	fmt.Println("% FACT:", header)
	fmt.Println(separator)
}

func dq(s string) string {
	return "\"" + s + "\""
}

func int64OrNil(prefix string, i sql.NullInt64) string {
	if i.Valid {
		return prefix + strconv.FormatInt(i.Int64, 10)
	}
	return "nil"
}

func maskableInt64(value int64) string {
	if MaskNonrepeatables {
		return "nil"
	}
	return strconv.FormatInt(value, 10)
}
