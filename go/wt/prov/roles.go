package prov

import (
	"fmt"
	"io"
	"strings"
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
	return allRoles
}

func WritePathRoleFacts(w io.Writer, pathRoles []PathRole) {
	printRowHeader(w, "wt_path_role(RunID, Path, PathIndex, Role).")
	for _, pr := range pathRoles {
		fmt.Fprintln(w, pr)
	}
}

func (pr PathRole) String() string {
	return fmt.Sprintf("wt_path_role(%s, %s, %s, %s).",
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
