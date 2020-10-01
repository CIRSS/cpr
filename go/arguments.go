package cpr

import (
	"fmt"
	"io"
	"strings"

	"github.com/cirss/cpr/rdf"
)

// Argument represents the arguments passed to executions recorded in the executed_files table of trace.sqlite3
type Argument struct {
	ExecID int64
	Index  int64
	Value  string
}

// GetArguments returns all arguments pass to execution recorded in the executed_files table of trace.sqlite3
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
	printRowHeader(w, "cpr_argument(ExecID, ArgIndex, ArgValue).")
	for _, a := range arguments {
		fmt.Fprintln(w, a)
	}
}

// String prints one row of the executed_files table of trace.sqlite3 as a Prolog fact
func (a Argument) String() string {
	return fmt.Sprintf("cpr_argument(%s, %d, %s).",
		E(a.ExecID), a.Index, Q(a.Value))
}

func AddArgumentTriples(g *rdf.Graph, arguments []Argument) {
	for _, a := range arguments {
		executionURI := ExecutionUri(g, a.ExecID)
		argumentURI := ArgumentUri(g, executionURI, a.Index)
		g.AddNewTriple(executionURI, "cpr:ExecArg", argumentURI)
		g.AddNewTriple(argumentURI, "rdf:type", g.NewUri("cpr:ExecArgument"))
		g.AddNewTriple(argumentURI, "cpr:ArgIndex", a.Index)
		g.AddNewTriple(argumentURI, "cpr:ArgValue", a.Value)
	}
}

func ArgumentUri(g *rdf.Graph, executionURI rdf.Uri, id int64) rdf.Uri {
	return g.NewExtendedUri(executionURI, fmt.Sprintf("arg/%d", id))
}
