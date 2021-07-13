package rpz

import (
	"fmt"
	"io"
	"strings"

	"github.com/cirss/cpr/pkg/cpr"
	"github.com/cirss/geist/pkg/rdf"
)

type PathRole struct {
	RunID     int64
	Path      string
	PathIndex int64
	Role      string
}

var (
	roleForPathIndex map[int64]string
)

func init() {
	roleForPathIndex = make(map[int64]string)
}

func GetPathRoleFacts(config cpr.Config, runID int64) []PathRole {
	var allRoles []PathRole
	addPathsWithRole(&allRoles, runID, "os", config.Roles.Os)
	addPathsWithRole(&allRoles, runID, "sw", config.Roles.Sw)
	addPathsWithRole(&allRoles, runID, "in", config.Roles.In)
	addPathsWithRole(&allRoles, runID, "out", config.Roles.Out)
	addPathsWithRole(&allRoles, runID, "tmp", config.Roles.Tmp)
	addPathsWithRole(&allRoles, runID, "nul", config.Roles.Nul)
	return allRoles
}

func (pr PathRole) String() string {
	return fmt.Sprintf("cpr_path_role(%s, %s, %s, %s).",
		R(pr.RunID), Q(pr.Path), I(pr.PathIndex), pr.Role)
}

func Role(path string) string {
	prefix := path
	prefixLength := len(path)
	for {
		prefixPathIndex, ok := PathIndex(prefix)
		t, ok := roleForPathIndex[prefixPathIndex]
		if ok {
			return t
		}
		prefixLength = strings.LastIndex(prefix, "/")
		if prefixLength == -1 {
			break
		}
		prefix = prefix[:prefixLength]
	}
	return "nil"
}

func addPathsWithRole(allRoles *[]PathRole, runID int64, role string, pathsWithRole []string) {
	for _, path := range pathsWithRole {
		pathIndex, _ := registerPathRole(path, role)
		pr := PathRole{runID, path, pathIndex, role}
		*allRoles = append(*allRoles, pr)
	}
}

func registerPathRole(path string, role string) (pathIndex int64, ok bool) {
	pathIndex, ok = PathIndex(path)
	if ok {
		roleForPathIndex[pathIndex] = role
	}
	return pathIndex, ok
}

func WritePathRoleFacts(w io.Writer, pathRoles []PathRole) {
	printRowHeader(w, "cpr_path_role(RunID, Path, PathIndex, Role).")
	for _, pr := range pathRoles {
		fmt.Fprintln(w, pr)
	}
}

func AddPathRoleTriples(g *rdf.Graph, pathRoles []PathRole) {
	for i, pr := range pathRoles {
		pathRoleURI := PathRoleURI(g, int64(i))
		g.AddNewTriple(pathRoleURI, "rdf:type", g.NewUri("cpr:ResourceRole"))
		g.AddNewTriple(pathRoleURI, "cpr:Path", pr.Path)
		switch pr.Role {
		case "sw":
			g.AddNewTriple(pathRoleURI, "cpr:Role", g.NewUri("cpr:software"))

		}
	}
}

func PathRoleURI(g *rdf.Graph, id int64) rdf.Uri {
	return g.NewUri(fmt.Sprintf("role/%d", id))
}
