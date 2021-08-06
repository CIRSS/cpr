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

func TestFindRoleOfPath_RoleDeclaredForRoot(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/", "os")

	assertPathHasRole(t, "/", "os")
	assertPathHasRole(t, "/usr", "os")
	assertPathHasRole(t, "/lib/", "os")
	assertPathHasRole(t, "/etc/fstab", "os")
	assertPathHasRole(t, "/etc/profile.d", "os")
	assertPathHasRole(t, "/etc/profile.d/", "os")

	assertPathHasNoRole(t, "")
	assertPathHasNoRole(t, "foo")
	assertPathHasNoRole(t, ".")
	assertPathHasNoRole(t, "..")
	assertPathHasNoRole(t, "./foo")
	assertPathHasNoRole(t, "../foo")
}

func TestFindRoleOfPath_ForRootChildDir(t *testing.T) {

	resetPathRoleIndex()
	registerPathRole("/etc", "os")

	assertPathHasRole(t, "/etc", "os")
	assertPathHasRole(t, "/etc/", "os")
	assertPathHasRole(t, "/etc/fstab", "os")
	assertPathHasRole(t, "/etc/profile.d", "os")
	assertPathHasRole(t, "/etc/profile.d/", "os")

	assertPathHasNoRole(t, "")
	assertPathHasNoRole(t, ".")
	assertPathHasNoRole(t, "..")
	assertPathHasNoRole(t, "/")
	assertPathHasNoRole(t, "/usr")
	assertPathHasNoRole(t, "/lib/")
	assertPathHasNoRole(t, "foo")
	assertPathHasNoRole(t, "./foo")
	assertPathHasNoRole(t, "../foo")
}
