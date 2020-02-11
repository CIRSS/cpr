package prov

import (
	"fmt"
	"io"
)

type AccessedPath struct {
	AccessID  string
	RunID     int64
	Path      string
	PathIndex int64
	PathRole  string
}

func GetAccessedPaths(executed []ExecutedFile, opened []OpenedFile) []AccessedPath {

	var accessed []AccessedPath

	for _, e := range executed {
		fileIndex, _ := PathIndex(e.Name)
		runID := e.RunID
		path := TrimWorkingDirPrefix(e.Name)
		role := Role(path)
		f := AccessedPath{E(e.ExecID), runID, path, fileIndex, role}
		accessed = append(accessed, f)
	}

	for _, o := range opened {
		fileIndex, _ := PathIndex(o.Name)
		runID := o.RunID
		path := TrimWorkingDirPrefix(o.Name)
		role := Role(path)
		f := AccessedPath{O(o.ID), runID, path, fileIndex, role}
		accessed = append(accessed, f)
	}

	return accessed
}

func WriteAccessedPathFacts(w io.Writer, accessed []AccessedPath) {
	printRowHeader(w, "wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).")
	for _, f := range accessed {
		fmt.Fprintln(w, f)
	}
}

func (f AccessedPath) String() string {
	return fmt.Sprintf("wt_accessed_path(%s, %s, %s, %s, %s).",
		f.AccessID, R(f.RunID), Q(f.Path), I(f.PathIndex), f.PathRole)
}
