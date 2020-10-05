package main

import (
	"fmt"
	"io"
	"os"

	"github.com/cirss/cpr"

	"github.com/tmcphillips/main-wrapper/mw"
)

// MW wraps the main() function.  It enables tests to manipulate the
// input and output streams used by main(), and provides a new FlagSet
// for each execution so that main() can be called by multiple tests.
var MW mw.MainWrapper

func init() {
	MW = mw.NewMainWrapper("rpz2cpr", main)
}

// Extracts provenance information from the specified ReproZip trace directory
func main() {

	var err error

	flags := MW.InitFlagSet()
	var name = flags.String("n", "", "Name of run")
	var mask = flags.Bool("m", false, "Mask unrepeatable attributes")
	var ignore = flags.Bool("i", false, "Ignore files written by the first process")
	var file = flags.String("file", "-", "File for saving trace")
	var format = flags.String("format", "facts", "Format for trace file")
	var store = flags.String("store", "", "URL of Blazegraph trace store")

	err = flags.Parse(os.Args[1:])
	if err != nil {
		fmt.Println(err)
		flags.Usage()
		return
	}

	cpr.TraceFormat = *format

	if *file != "-" {
		cpr.TraceFile, err = os.Create(*file)
		if err != nil {
			panic(err)
		}
	}

	config := cpr.LoadConfig("rpz2cpr.yml")

	cpr.MaskNonrepeatables = *mask
	cpr.IgnoreFirstProcessFiles = *ignore
	cpr.TraceStore = *store

	var traceDirectory string
	switch flags.NArg() {
	case 1:
		traceDirectory = flags.Arg(0)
	default:
		flags.Usage()
		return
	}

	trace := cpr.ExtractTrace(*name, traceDirectory, config)

	if len(cpr.TraceStore) == 0 {

		switch cpr.TraceFormat {

		case "facts":
			cpr.WriteTraceFacts(trace)

		case "triples":
			graph := cpr.GetTraceGraph(trace)
			io.WriteString(cpr.TraceFile, graph.String())
		}
	} else {

	}
}
