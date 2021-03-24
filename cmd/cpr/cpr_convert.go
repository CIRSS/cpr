package main

import (
	"io"
	"os"

	"github.com/cirss/cpr/pkg/cpr"
	"github.com/cirss/cpr/pkg/rpz"
	"github.com/cirss/go-cli/pkg/cli"
)

func Convert(cc *cli.CommandContext) (err error) {

	// declare command flags
	name := cc.Flags.String("n", "", "Name of run")
	mask := cc.Flags.Bool("m", false, "Mask unrepeatable attributes")
	ignore := cc.Flags.Bool("i", false, "Ignore files written by the first process")
	file := cc.Flags.String("file", "-", "File for saving trace")
	format := cc.Flags.String("format", "facts", "Format for trace file")
	traceDirectory := cc.Flags.String("trace", "./.reprozip-trace", "Directory with ReproZip trace")

	// parse flags
	var helped bool
	if helped, err = cc.ParseFlags(); helped || err != nil {
		return
	}

	traceFile := os.Stdout

	if *file != "-" {
		traceFile, err = os.Create(*file)
		if err != nil {
			return
		}
	}

	config := cpr.LoadConfig("rpz2cpr.yml")

	rpz.MaskNonrepeatables = *mask
	rpz.IgnoreFirstProcessFiles = *ignore

	trace := rpz.ExtractTrace(*name, *traceDirectory, config)

	switch *format {

	case "facts":
		rpz.WriteTraceFacts(traceFile, trace)

	case "triples":
		graph := rpz.GetTraceGraph(trace)
		io.WriteString(traceFile, graph.String())
	}

	return
}
