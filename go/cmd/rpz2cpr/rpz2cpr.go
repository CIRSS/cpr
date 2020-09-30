package main

import (
	"fmt"
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
	var rpz = flags.String("rpz", "-", "File for saving ReproZip facts")
	var wt = flags.String("wt", "-", "File for saving WT facts")

	err = flags.Parse(os.Args[1:])
	if err != nil {
		fmt.Println(err)
		flags.Usage()
		return
	}

	if *rpz != "-" {
		cpr.RPZFactsFile, err = os.Create(*rpz)
		if err != nil {
			panic(err)
		}
	}

	if *wt != "-" {
		cpr.WTFactsFile, err = os.Create(*wt)
		if err != nil {
			panic(err)
		}
	}

	config := cpr.LoadConfig("rpz2cpr.yml")

	cpr.MaskNonrepeatables = *mask
	cpr.IgnoreFirstProcessFiles = *ignore

	switch flags.NArg() {
	case 1:
		traceDirectory := flags.Arg(0)
		cpr.ExtractTrace(*name, traceDirectory, config)
	default:
		flags.Usage()
		return
	}
}
