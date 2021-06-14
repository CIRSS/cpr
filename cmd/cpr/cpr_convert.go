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
	name := cc.Flags.String("name", "", "Name to apply to destination trace")
	noroot := cc.Flags.Bool("noroot", false, "Exclude root of process tree from destination trace")
	notimestamps := cc.Flags.Bool("notimestamps", false, "Exclude timestamps from destination trace")
	dest := cc.Flags.String("dest", "", "Destination of `trace` conversion")
	cc.Flags.String("from", "", "Source trace `format`")
	to := cc.Flags.String("to", "", "Destination trace `format`")
	src := cc.Flags.String("src", "", "Source `trace` to convert")

	// parse flags
	var helped bool
	if helped, err = cc.ParseFlags(); helped || err != nil {
		return
	}

	traceFile := os.Stdout

	if *dest != "" {
		traceFile, err = os.Create(*dest)
		if err != nil {
			return
		}
	}

	config := cpr.LoadConfig("cpr.yml")

	rpz.MaskTimestamps = *notimestamps
	rpz.IgnoreFirstProcessFiles = *noroot

	trace := rpz.ExtractTrace(*name, *src, config)

	switch *to {

	case "facts":
		rpz.WriteTraceFacts(traceFile, trace)

	case "triples":
		graph := rpz.GetTraceGraph(trace)
		io.WriteString(traceFile, graph.String())
	}

	return
}
