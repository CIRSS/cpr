package prov

import (
	"fmt"
	"io"
)

type AccessedFile struct {
	ID        string
	FilePath  string
	FileIndex int64
	FileRole  string
}

func GetAccessedFiles(executed []ExecutedFile, opened []OpenedFile) []AccessedFile {

	var accessed []AccessedFile

	WorkingDirFileIndex, _ = FileIndex(executed[0].WorkingDir)

	for _, e := range executed {
		fileIndex, _ := FileIndex(e.Name)
		path := TrimWorkingDirPrefix(e.Name)
		role := FileRole(path)
		f := AccessedFile{E(e.ID), path, fileIndex, role}
		accessed = append(accessed, f)
	}

	for _, o := range opened {
		fileIndex, _ := FileIndex(o.Name)
		path := TrimWorkingDirPrefix(o.Name)
		role := FileRole(path)
		f := AccessedFile{O(o.ID), path, fileIndex, role}
		accessed = append(accessed, f)
	}

	return accessed
}

func WriteAccessedFacts(w io.Writer, accessed []AccessedFile) {
	printRowHeader(w, "wt_accessed(ID, FilePath, FileIndex, FileRole).")
	for _, f := range accessed {
		fmt.Fprintln(w, f)
	}
}

func (f AccessedFile) String() string {
	return fmt.Sprintf("wt_accessed(%s, %s, %s, %s).",
		f.ID, Q(f.FilePath), I(f.FileIndex), f.FileRole)
}
