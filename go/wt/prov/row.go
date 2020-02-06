package prov

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

func Q(s string) string {
	return "'" + s + "'"
}

func int64OrNil(prefix string, i sql.NullInt64) string {
	if i.Valid {
		return prefix + strconv.FormatInt(i.Int64, 10)
	}
	return "nil"
}

func D(id int64) string {
	return Prepend("d", id)
}

func E(id int64) string {
	return Prepend("e", id)
}

func I(id int64) string {
	return Prepend("i", id)
}

func O(id int64) string {
	return Prepend("o", id)
}

func P(id int64) string {
	return Prepend("p", id)
}

func R(id int64) string {
	return Prepend("r", id)
}

func Prepend(s string, i int64) string {
	return s + strconv.FormatInt(i, 10)
}

func maskableInt64(value int64) string {
	if MaskNonrepeatables {
		return "nil"
	}
	return strconv.FormatInt(value, 10)
}
