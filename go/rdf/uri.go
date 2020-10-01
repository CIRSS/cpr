package rdf

type Uri struct {
	Value string
	Type  string
}

func (u Uri) String() string {
	if u.Type == "prefixed" {
		return u.Value
	}
	return "<" + u.Value + ">"
}
