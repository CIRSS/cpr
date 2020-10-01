package rdf

type Subject struct {
	value Uri
}

func (g *Graph) NewSubject(s interface{}) (subject Subject) {
	switch s.(type) {
	case Uri:
		subject = Subject{s.(Uri)}
	case string:
		subject = Subject{g.NewUri(s.(string))}
	}
	return Subject{s.(Uri)}
}

func (s Subject) String() string {
	return s.value.String()
}
