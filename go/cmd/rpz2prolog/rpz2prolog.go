package main

import (
	"fmt"
	"os"

	"github.com/whole-tale/wt-prov-model/reprozip"

	"github.com/tmcphillips/main-wrapper/mw"
)

// MW wraps the main() function.  It enables tests to manipulate the
// input and output streams used by main(), and provides a new FlagSet
// for each execution so that main() can be called by multiple tests.
var MW mw.MainWrapper

func init() {
	MW = mw.NewMainWrapper("reprozip2prolog", main)
}

// Extracts provenance information from the specified ReproZip trace directory
func main() {

	var err error

	flags := MW.InitFlagSet()
	var name = flags.String("n", "", "Name of run")
	var mask = flags.Bool("m", false, "Mask unrepeatable attributes")
	var ignore = flags.Bool("i", false, "Ignore files written by the first process")

	err = flags.Parse(os.Args[1:])
	if err != nil {
		fmt.Println(err)
		flags.Usage()
		return
	}

	reprozip.MaskNonrepeatables = *mask
	reprozip.IgnoreFirstProcessFiles = *ignore

	switch flags.NArg() {
	case 1:
		traceDirectory := flags.Arg(0)
		reprozip.ExtractTrace(*name, traceDirectory)
	default:
		flags.Usage()
		return
	}
}
