package main

import (
	"fmt"
	"io"
	"os"

	"github.com/cirss/cpr/pkg/cpr"
	"github.com/cirss/cpr/pkg/rpz"
	"github.com/cirss/go-cli/pkg/cli"
)

var Main *cli.ProgramContext

func init() {
	Main = cli.NewProgramContext("rpz2cpr", main)
}

// Extracts provenance information from the specified ReproZip trace directory
func main() {

	var err error

	cc := cli.NewCommandContext(Main, nil)

	var name = cc.Flags.String("n", "", "Name of run")
	var mask = cc.Flags.Bool("m", false, "Mask unrepeatable attributes")
	var ignore = cc.Flags.Bool("i", false, "Ignore files written by the first process")
	var file = cc.Flags.String("file", "-", "File for saving trace")
	var format = cc.Flags.String("format", "facts", "Format for trace file")
	var store = cc.Flags.String("store", "", "URL of Blazegraph trace store")

	err = cc.Flags.Parse(os.Args[1:])
	if err != nil {
		fmt.Println(err)
		cc.Flags.Usage()
		return
	}

	config := cpr.LoadConfig("rpz2cpr.yml")

	rpz.MaskNonrepeatables = *mask
	rpz.IgnoreFirstProcessFiles = *ignore

	var traceDirectory string
	switch cc.Flags.NArg() {
	case 1:
		traceDirectory = cc.Flags.Arg(0)
	default:
		cc.Flags.Usage()
		return
	}

	trace := rpz.ExtractTrace(*name, traceDirectory, config)

	if len(*store) == 0 {

		traceFile := os.Stdout

		if *file != "-" {
			traceFile, err = os.Create(*file)
			if err != nil {
				panic(err)
			}
		}

		switch *format {

		case "facts":
			rpz.WriteTraceFacts(traceFile, trace)

		case "triples":
			graph := rpz.GetTraceGraph(trace)
			io.WriteString(traceFile, graph.String())
		}
	} else {

	}
}
