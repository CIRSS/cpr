package prov

import (
	"fmt"
	"io"
)

type AccessedPath struct {
	ID        string
	Path      string
	PathIndex int64
	PathRole  string
}

func GetAccessedPaths(executed []ExecutedFile, opened []OpenedFile) []AccessedPath {

	var accessed []AccessedPath

	WorkingDirFileIndex, _ = FileIndex(executed[0].WorkingDir)

	for _, e := range executed {
		fileIndex, _ := FileIndex(e.Name)
		path := TrimWorkingDirPrefix(e.Name)
		role := Role(path)
		f := AccessedPath{E(e.ID), path, fileIndex, role}
		accessed = append(accessed, f)
	}

	for _, o := range opened {
		fileIndex, _ := FileIndex(o.Name)
		path := TrimWorkingDirPrefix(o.Name)
		role := Role(path)
		f := AccessedPath{O(o.ID), path, fileIndex, role}
		accessed = append(accessed, f)
	}

	return accessed
}

func WriteAccessedPathFacts(w io.Writer, accessed []AccessedPath) {
	printRowHeader(w, "wt_accessed_path(ID, Path, PathIndex, PathRole).")
	for _, f := range accessed {
		fmt.Fprintln(w, f)
	}
}

func (f AccessedPath) String() string {
	return fmt.Sprintf("wt_accessed_path(%s, %s, %s, %s).",
		f.ID, Q(f.Path), I(f.PathIndex), f.PathRole)
}
