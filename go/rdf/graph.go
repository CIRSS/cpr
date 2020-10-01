package rdf

import (
	"fmt"
	"strings"
)

type Prefix struct {
	Prefix    string
	Expansion string
}

func (p *Prefix) Turtle() string {
	return fmt.Sprintf("@prefix %s: <%s> .\n", p.Prefix, p.Expansion)
}

type Graph struct {
	prefixes []Prefix
	triples  []Triple
}

func NewGraph() *Graph {
	graph := new(Graph)
	return graph
}

func (g *Graph) NewUri(s string) (uri Uri) {
	if s[0] == ':' {
		uri = Uri{s, "relative"}
	} else if g.StartsWithPrefix(s) {
		uri = Uri{s, "prefixed"}
	} else {
		uri = Uri{s, "absolute"}
	}
	return
}

func (g *Graph) StartsWithPrefix(s string) bool {
	for _, prefix := range g.prefixes {
		if strings.HasPrefix(s, prefix.Prefix+":") {
			return true
		}
	}
	return false
}

func (g *Graph) AddNewTriple(s interface{}, p interface{}, o interface{}) {
	sub := g.NewSubject(s)
	pred := g.NewPredicate(p)
	obj := g.NewObject(o)
	g.triples = append(g.triples, Triple{sub, pred, obj})
}

func (g *Graph) AddNewPrefix(prefix string, expansion string) {
	g.prefixes = append(g.prefixes, Prefix{prefix, expansion})
}

func (g *Graph) String() string {
	var buffer strings.Builder
	for _, prefix := range g.prefixes {
		buffer.WriteString(prefix.Turtle())
	}
	buffer.WriteRune('\n')
	for _, triple := range g.triples {
		buffer.WriteString(triple.Turtle())
	}
	return buffer.String()
}
