package main

import (
	"strings"
	"testing"

	"github.com/cirss/go-cli/pkg/util"
)

func TestCPR_no_command(t *testing.T) {

	var outputBuffer strings.Builder
	Program.OutWriter = &outputBuffer
	Program.ErrWriter = &outputBuffer

	Program.AssertExitCode(t, "cpr", 1)

	util.LineContentsEqual(t, outputBuffer.String(),
		`cpr: no command given

        usage: cpr <command> [<flags>]

        commands:
          convert  - Convert between trace representations
          help     - Show help

        flags:
          -quiet
            	Discard normal command output
          -silent
            	Discard normal and error command output
          -store URL
            	URL of CPR provenance store (default "http://127.0.0.1:9999/blazegraph")

        See 'cpr help <command>' for help with one of the above commands.
		`)
}

func TestCLR_help_command_with_no_argument(t *testing.T) {

	var outputBuffer strings.Builder
	Program.OutWriter = &outputBuffer
	Program.ErrWriter = &outputBuffer

	Program.AssertExitCode(t, "cpr help", 0)

	util.LineContentsEqual(t, outputBuffer.String(),
		`usage: cpr <command> [<flags>]

        commands:
          convert  - Convert between trace representations
          help     - Show help

        flags:
          -quiet
            	Discard normal command output
          -silent
            	Discard normal and error command output
          -store URL
            	URL of CPR provenance store (default "http://127.0.0.1:9999/blazegraph")

        See 'cpr help <command>' for help with one of the above commands.
		`)
}

func TestCPR_unsupported_command(t *testing.T) {

	var outputBuffer strings.Builder
	Program.OutWriter = &outputBuffer
	Program.ErrWriter = &outputBuffer

	Program.AssertExitCode(t, "cpr not-a-command", 1)

	util.LineContentsEqual(t, outputBuffer.String(),
		`cpr: unrecognized command: not-a-command

        usage: cpr <command> [<flags>]

        commands:
          convert  - Convert between trace representations
          help     - Show help

        flags:
          -quiet
            	Discard normal command output
          -silent
            	Discard normal and error command output
          -store URL
            	URL of CPR provenance store (default "http://127.0.0.1:9999/blazegraph")

        See 'cpr help <command>' for help with one of the above commands.
		`)
}

func TestCPR_help_unsupported_command(t *testing.T) {

	var outputBuffer strings.Builder
	Program.OutWriter = &outputBuffer
	Program.ErrWriter = &outputBuffer

	Program.AssertExitCode(t, "cpr help not-a-command", 1)

	util.LineContentsEqual(t, outputBuffer.String(),
		`cpr help: unrecognized cpr command: not-a-command

        usage: cpr <command> [<flags>]

        commands:
          convert  - Convert between trace representations
          help     - Show help

        flags:
          -quiet
            	Discard normal command output
          -silent
            	Discard normal and error command output
          -store URL
            	URL of CPR provenance store (default "http://127.0.0.1:9999/blazegraph")

        See 'cpr help <command>' for help with one of the above commands.
		`)
}
