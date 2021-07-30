package rpz

import (
	"database/sql"
	"fmt"
	"io"
	"strconv"
)

const (
	separator = "%---------------------------------------------------------------------------------------------------"
)

func printRowHeader(writer io.Writer, header string) {
	fmt.Fprintln(writer)
	fmt.Fprintln(writer, separator)
	fmt.Fprintln(writer, "% FACT:", header)
	fmt.Fprintln(writer, separator)
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

func timestampUint64(value uint64) string {
	if MaskTimestamps {
		return "nil"
	}
	return strconv.FormatUint(value, 10)
}
