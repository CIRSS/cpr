package rdf

type Predicate struct {
	value Uri
}

func (g *Graph) NewPredicate(p interface{}) (predicate Predicate) {
	switch p.(type) {
	case Uri:
		return Predicate{p.(Uri)}
	case string:
		return Predicate{g.NewUri(p.(string))}
	}
	return
}

func (p Predicate) String() (s string) {
	return p.value.String()
}
