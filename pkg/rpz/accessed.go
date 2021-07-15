package rpz

import (
	"fmt"
	"io"

	"github.com/cirss/geist/pkg/rdf"
)

type AccessedPath struct {
	AccessID  string
	RunID     int64
	Absolute  string
	Relative  string
	PathIndex int64
	PathRole  string
}

func GetAccessedPaths(executed []Execution, opens []FileOpen) []AccessedPath {

	var accessed []AccessedPath

	for _, e := range executed {
		fileIndex, _ := PathIndex(e.Name)
		runID := e.RunID
		path := TrimWorkingDirPrefix(e.Name)
		role := Role(path)
		if role != "nul" {
			f := AccessedPath{E(e.ExecID), runID, e.Name, path, fileIndex, role}
			accessed = append(accessed, f)
		}
	}

	for _, o := range opens {
		fileIndex, _ := PathIndex(o.Name)
		runID := o.RunID
		path := TrimWorkingDirPrefix(o.Name)
		role := Role(path)
		f := AccessedPath{O(o.OpenID), runID, o.Name, path, fileIndex, role}
		accessed = append(accessed, f)
	}

	return accessed
}

func WriteAccessedPathFacts(w io.Writer, accessed []AccessedPath) {
	printRowHeader(w, "cpr_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).")
	for _, f := range accessed {
		fmt.Fprintln(w, f)
	}
}

func (f AccessedPath) String() string {
	return fmt.Sprintf("cpr_accessed_path(%s, %s, %s, %s, %s).",
		f.AccessID, R(f.RunID), Q(f.Relative), I(f.PathIndex), f.PathRole)
}

func AddAccessedPathTriples(g *rdf.Graph, accessed []AccessedPath) {
	for _, ap := range accessed {
		relativePathUri := AccessedPathUri(g, ap.PathIndex)
		g.AddNewTriple(relativePathUri, "rdf:type", g.NewUri("os:FileResource"))
		g.AddNewTriple(relativePathUri, "os:absolutePath", ap.Absolute)
		g.AddNewTriple(relativePathUri, "os:relativePath", ap.Relative)
	}
}

func AccessedPathUri(g *rdf.Graph, pathIndex int64) rdf.Uri {
	return g.NewUri(fmt.Sprintf("fileresource/%d", pathIndex))
}
