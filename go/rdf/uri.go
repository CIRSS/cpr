package rdf

import "strings"

type Uri struct {
	Value string
	Type  string
}

func (u Uri) String() string {
	if u.Type == "prefixed" && !strings.Contains(u.Value, "/") {
		return u.Value
	}
	return "<" + u.Value + ">"
}
