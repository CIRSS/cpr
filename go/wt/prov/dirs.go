package prov

import (
	"fmt"
	"io"
)

var (
	nextDirID = int64(1)
)

type Directory struct {
	DirID     int64
	RunID     int64
	FilePath  string
	FileIndex int64
	DirType   string
}

func addDirectories(allDirs *[]Directory, runID int64, dirType string, dirsOfType []string) {
	for _, dir := range dirsOfType {
		fileIndex, _ := FileIndex(dir)
		d := Directory{nextDirID, runID, dir, fileIndex, dirType}
		*allDirs = append(*allDirs, d)
		nextDirID++
	}
}

func GetDirectories(config Config, runID int64) []Directory {
	var allDirs []Directory
	addDirectories(&allDirs, runID, "os", config.Dirs.Os)
	addDirectories(&allDirs, runID, "sw", config.Dirs.Sw)
	addDirectories(&allDirs, runID, "in", config.Dirs.In)
	addDirectories(&allDirs, runID, "out", config.Dirs.Out)
	return allDirs
}

func WriteDirectoryFacts(w io.Writer, directories []Directory) {
	printRowHeader(w, "wt_directory(DirID, RunID, DirType, FilePath, FileIndex).")
	for _, d := range directories {
		fmt.Fprintln(w, d)
	}
}

func (d Directory) String() string {
	return fmt.Sprintf("wt_directory(%s, %s, %s, %s, %s).",
		D(d.DirID), R(d.RunID), d.DirType, Q(d.FilePath), I(d.FileIndex))
}
