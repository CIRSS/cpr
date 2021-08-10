package cpr

import (
	"fmt"
	"io"
	"path/filepath"
	"strings"

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

func GetPathRoleFacts(config Config, runID int64) []PathRole {
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

func FindRoleOfPath(path string) (role string, ok bool) {
	path, err := filepath.Abs(path)
	if err != nil {
		return "", false
	}
	for {

		// look up index of path
		pathIndex, ok := PathIndex(path)

		// if there is a role associated with the index return it
		t, ok := roleForPathIndex[pathIndex]
		if ok {
			return t, true
		}

		// if the path with no role stop search in failure
		if path == "/" {
			break
		}

		// find the end of the longest remaining prefix in the path
		finalSlashIndex := strings.LastIndex(path, "/")

		// if there is no remaining prefix stop search in failure
		if finalSlashIndex == -1 {
			break
		}

		// reduce path to longest remaining prefix and repeat loop
		if finalSlashIndex == 0 {
			path = "/"
		} else {
			path = path[:finalSlashIndex]
		}
	}

	return "", false
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
	PrintRowHeader(w, "cpr_path_role(RunID, Path, PathIndex, Role).")
	for _, pr := range pathRoles {
		fmt.Fprintln(w, pr)
	}
}

func AddPathRoleTriples(g *rdf.Graph, pathRoles []PathRole) {
	for i, pr := range pathRoles {
		pathRoleURI := PathRoleURI(g, int64(i))
		g.AddNewTriple(pathRoleURI, "rdf:type", g.NewUri("cpr:ResourceRole"))
		g.AddNewTriple(pathRoleURI, "cpr:resourcePath", pr.Path)
		switch pr.Role {
		case "sw":
			g.AddNewTriple(pathRoleURI, "cpr:Role", g.NewUri("cpr:software"))

		}
	}
}

func PathRoleURI(g *rdf.Graph, id int64) rdf.Uri {
	return g.NewUri(fmt.Sprintf("role/%d", id))
}
