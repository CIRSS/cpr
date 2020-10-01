package rdf

import (
	"fmt"
	"strings"
)

type Prefix struct {
	Prefix    string
	Expansion Uri
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

func (g *Graph) AddNewTriple(s Subject, p Predicate, o Object) {
	g.triples = append(g.triples, Triple{s, p, o})
}

func (g *Graph) AddNewPrefix(prefix string, expansion Uri) {
	g.prefixes = append(g.prefixes, Prefix{prefix, expansion})
}

func (g *Graph) String() string {
	var buffer strings.Builder
	for _, prefix := range g.prefixes {
		buffer.WriteString(prefix.Turtle())
	}
	for _, triple := range g.triples {
		buffer.WriteString(triple.Turtle())
	}
	return buffer.String()
}
