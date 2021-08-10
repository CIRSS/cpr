package cpr

import "testing"

func resetPathRoleIndex() {
	roleForPathIndex = make(map[int64]string)
}

func assertPathHasRole(t *testing.T, path string, expectedRole string) {
	actualRole, ok := FindRoleOfPath(path)
	if !ok || expectedRole != actualRole {
		t.Fail()
	}
}

func assertPathHasNoRole(t *testing.T, path string) {
	_, ok := FindRoleOfPath(path)
	if ok {
		t.Fail()
	}
}

func TestFindRoleOfPath_RoleDeclaredForRoot_AbsolutePathsAffected(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/", "os")

	assertPathHasRole(t, "/", "os")
	assertPathHasRole(t, "/usr", "os")
	assertPathHasRole(t, "/lib/", "os")
	assertPathHasRole(t, "/etc/fstab", "os")
	assertPathHasRole(t, "/etc/profile.d", "os")
	assertPathHasRole(t, "/etc/profile.d/", "os")
	assertPathHasRole(t, "/this/is/a/fake/path/", "os")
}

func TestFindRoleOfPath_RoleDeclaredForRoot_RelativePathsAffected(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/", "os")

	assertPathHasRole(t, ".", "os")
	assertPathHasRole(t, "..", "os")
	assertPathHasRole(t, "./testdata", "os")
	assertPathHasRole(t, "../rpz", "os")
	assertPathHasRole(t, "./not/a/directory", "os")
	assertPathHasRole(t, "./testdata/not-a-file", "os")
}

func TestFindRoleOfPath_RoleDeclaredForRootChild_AbsolutePathsAtOrBelowRootChildAffected(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/etc", "os")

	assertPathHasRole(t, "/etc", "os")
	assertPathHasRole(t, "/etc/", "os")
	assertPathHasRole(t, "/etc/fstab", "os")
	assertPathHasRole(t, "/etc/profile.d", "os")
	assertPathHasRole(t, "/etc/profile.d/", "os")
	assertPathHasRole(t, "/etc/not-a-file", "os")

	assertPathHasNoRole(t, "/usr")
	assertPathHasNoRole(t, "/lib/")
}

func TestFindRoleOfPath_RoleDeclaredForRootChild_RelativePathsUnaffected(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/etc", "os")

	assertPathHasNoRole(t, ".")
	assertPathHasNoRole(t, "..")
	assertPathHasNoRole(t, "./testdata")
	assertPathHasNoRole(t, "../rpz")
}

func TestFindRoleOfPath_DifferentRolesDeclaredForRootAndRootChild(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/", "os")
	registerPathRole("/etc", "sys")

	assertPathHasRole(t, "/", "os")
	assertPathHasRole(t, "/usr", "os")
	assertPathHasRole(t, "/lib/", "os")
	assertPathHasRole(t, "/this/is/a/fake/path/", "os")

	assertPathHasRole(t, "/etc", "sys")
	assertPathHasRole(t, "/etc/", "sys")
	assertPathHasRole(t, "/etc/fstab", "sys")
	assertPathHasRole(t, "/etc/profile.d", "sys")
	assertPathHasRole(t, "/etc/profile.d/", "sys")
	assertPathHasRole(t, "/etc/not-a-file", "sys")

	assertPathHasRole(t, ".", "os")
	assertPathHasRole(t, "..", "os")
	assertPathHasRole(t, "./testdata", "os")
	assertPathHasRole(t, "../rpz", "os")
	assertPathHasRole(t, "./not/a/directory", "os")
	assertPathHasRole(t, "./testdata/not-a-file", "os")
}

func TestFindRoleOfPath_DifferentRolesDeclaredForRootAndCurrentDirectory(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/", "os")
	registerPathRole(".", "sw")

	assertPathHasRole(t, "/", "os")
	assertPathHasRole(t, "/usr", "os")
	assertPathHasRole(t, "/lib/", "os")
	assertPathHasRole(t, "/this/is/a/fake/path/", "os")

	assertPathHasRole(t, "..", "os")
	assertPathHasRole(t, "../rpz", "os")

	assertPathHasRole(t, ".", "sw")
	assertPathHasRole(t, "./testdata", "sw")
	assertPathHasRole(t, "./not/a/directory", "sw")
	assertPathHasRole(t, "./testdata/not-a-file", "sw")
}

func TestFindRoleOfPath_DifferentRolesSubdirectoriesOfCurrentDirectory(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole(".", "sw")
	registerPathRole("./testdata", "tests")
	registerPathRole("./testdata/workspace/inputs", "data")
	registerPathRole("./testdata/workspace/outputs", "data")
	registerPathRole("./testdata/workspace/temp", "tmp")

	assertPathHasRole(t, ".", "sw")
	assertPathHasRole(t, "./testdata", "tests")
	assertPathHasRole(t, "./testdata/not-a-file", "tests")
	assertPathHasRole(t, "./testdata/workspace", "tests")
	assertPathHasRole(t, "./testdata/workspace/inputs", "data")
	assertPathHasRole(t, "./testdata/workspace/outputs", "data")
	assertPathHasRole(t, "./testdata/workspace/temp", "tmp")
}
