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
		-dest trace
			Destination of trace conversion
		-from format
			Source trace format
		-name string
			Name to apply to destination trace
		-noroot
	    	Exclude root of process tree from destination trace
		-notimestamps
			Exclude timestamps from destination trace
		-quiet
			Discard normal command output
		-silent
			Discard normal and error command output
		-src trace
			Source trace to convert
		-to format
			Destination trace format
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
