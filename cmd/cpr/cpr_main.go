package main

import (
	"os"

	"github.com/cirss/blaze/pkg/blaze"
	"github.com/cirss/go-cli/pkg/cli"
)

var Program *cli.ProgramContext

func init() {
	Program = cli.NewProgramContext("cpr", main)
}

func main() {
	cc := NewCPRCommandContext(Program)
	cc.InvokeCommand(os.Args)
}

func NewCPRCommandContext(pc *cli.ProgramContext) (cc *cli.CommandContext) {

	commands := cli.NewCommandSet([]cli.CommandDescriptor{
		{"convert", Convert, "Convert between trace representations",
			"Converts a run trace from one representation to another."},
		{"help", cli.Help, "Show help", ""},
		// {"import", Import, "Import a trace.",
		// 	"Imports a trace into the CPR provenance store."},
	})

	cc = cli.NewCommandContext(pc, commands)
	cc.AddProvider("BlazegraphClient", getBlazegraphClient)
	cc.Flags.String("store", blaze.DefaultUrl, "`URL` of CPR provenance store")

	return
}

func getBlazegraphClient(cc *cli.CommandContext) (bc interface{}) {
	bcc, exists := cc.Properties["blazegraph_client"]
	if exists {
		bc = bcc.(*blaze.BlazegraphClient)
	} else {
		instanceFlag := cc.Flags.Lookup("store").Value.String()
		bc = blaze.NewBlazegraphClient(instanceFlag)
		cc.Properties["blazegraph_client"] = bc
	}
	return
}
