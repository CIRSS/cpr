package main

import (
	"strings"
	"testing"

	"github.com/cirss/go-cli/pkg/util"
)

var expectedConvertHelpOutput = string(
	`cpr convert: Converts a run trace from one representation to another.

	usage: cpr convert [<flags>]

	flags:
	  -file string
			File for saving trace (default "-")
	  -format string
			Format for trace file (default "facts")
	  -i	Ignore files written by the first process
	  -m	Mask unrepeatable attributes
	  -n string
			Name of run
	  -quiet
			Discard normal command output
	  -silent
			Discard normal and error command output
	  -store URL
			URL of CPR provenance store (default "http://127.0.0.1:9999/blazegraph")
	  -trace string
			Directory with ReproZip trace (default "./.reprozip-trace")
	`)

func TestCPR_convert_help(t *testing.T) {
	var outputBuffer strings.Builder
	Program.OutWriter = &outputBuffer
	Program.ErrWriter = &outputBuffer
	Program.AssertExitCode(t, "cpr convert help", 0)
	util.LineContentsEqual(t, outputBuffer.String(), expectedConvertHelpOutput)
}

func TestBlazegraphCmd_help_export(t *testing.T) {
	var outputBuffer strings.Builder
	Program.OutWriter = &outputBuffer
	Program.ErrWriter = &outputBuffer
	Program.AssertExitCode(t, "cpr help convert", 0)
	util.LineContentsEqual(t, outputBuffer.String(), expectedConvertHelpOutput)
}
