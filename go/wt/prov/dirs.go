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
	DirRole   string
}

func addDirectories(allDirs *[]Directory, runID int64, DirRole string, dirsWithRole []string) {
	for _, dir := range dirsWithRole {
		fileIndex, _ := RegisterDirectory(dir, DirRole)
		d := Directory{nextDirID, runID, dir, fileIndex, DirRole}
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
	printRowHeader(w, "wt_directory(DirID, RunID, FilePath, FileIndex, DirRole).")
	for _, d := range directories {
		fmt.Fprintln(w, d)
	}
}

func (d Directory) String() string {
	return fmt.Sprintf("wt_directory(%s, %s, %s, %s, %s).",
		D(d.DirID), R(d.RunID), Q(d.FilePath), I(d.FileIndex), d.DirRole)
}
