package rdf

import (
	"fmt"
)

type Triple struct {
	S Subject
	P Predicate
	O Object
}

func (t *Triple) Turtle() string {
	return fmt.Sprintf("%s %s %s .\n", t.S, t.P, t.O)
}
