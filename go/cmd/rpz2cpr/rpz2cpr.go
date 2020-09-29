package main

import (
	"fmt"
	"os"

	"github.com/cirss/cpr/wt/prov"

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
	var rpz = flags.String("rpz", "-", "File for saving ReproZip facts")
	var wt = flags.String("wt", "-", "File for saving WT facts")

	err = flags.Parse(os.Args[1:])
	if err != nil {
		fmt.Println(err)
		flags.Usage()
		return
	}

	if *rpz != "-" {
		prov.RPZFactsFile, err = os.Create(*rpz)
		if err != nil {
			panic(err)
		}
	}

	if *wt != "-" {
		prov.WTFactsFile, err = os.Create(*wt)
		if err != nil {
			panic(err)
		}
	}

	config := prov.LoadConfig("rpz2cpr.yml")

	prov.MaskNonrepeatables = *mask
	prov.IgnoreFirstProcessFiles = *ignore

	switch flags.NArg() {
	case 1:
		traceDirectory := flags.Arg(0)
		prov.ExtractTrace(*name, traceDirectory, config)
	default:
		flags.Usage()
		return
	}
}
