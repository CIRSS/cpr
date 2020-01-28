package reprozip

import (
	"fmt"
	"strconv"
	"database/sql"
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

func int32OrNil(prefix string, i sql.NullInt32) string {
	if i.Valid {
		return prefix + strconv.FormatInt(int64(processId(i.Int32)), 10)
	}
	return "nil"
}

func maskableInt64(value int64) string {
	if MaskNonrepeatables {
		return "nil"
	}
	return strconv.FormatInt(value, 10)
}

func processId(value int32) int32 {
	if ZeroOffsetProcessIDs {
		return value - 1
	}
	return value
}
