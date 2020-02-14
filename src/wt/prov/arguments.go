package prov

import (
	"fmt"
	"io"
	"strings"
)

// Argument represents the arguments passed to executions recorded in the executed_files table of trace.sqlite3
type Argument struct {
	ExecID int64
	Index  int64
	Value  string
}

// GetArguments returns all arguments pass to execution recorded in thee executed_files table of trace.sqlite3
func GetArguments(executions []Execution) []Argument {
	var arguments []Argument
	for _, e := range executions {
		argsLen := len(e.Argv)
		if argsLen > 0 {
			if e.Argv[argsLen-1] == '\x00' {
				e.Argv = e.Argv[:argsLen-1]
			}
			args := strings.Split(e.Argv, "\x00")
			for i, value := range args {
				a := Argument{e.ExecID, int64(i), value}
				arguments = append(arguments, a)
			}
		}
	}
	return arguments
}

func WriteArgumentFacts(w io.Writer, arguments []Argument) {
	printRowHeader(w, "rpz_argument(ExecID, ArgIndex, ArgValue).")
	for _, a := range arguments {
		fmt.Fprintln(w, a)
	}
}

// String prints one row of the executed_files table of trace.sqlite3 as a Prolog fact
func (a Argument) String() string {
	return fmt.Sprintf("rpz_argument(%s, %d, %s).",
		E(a.ExecID), a.Index, Q(a.Value))
}
