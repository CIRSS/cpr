package rdf

import (
	"fmt"
)

type Uri string
type Subject Uri
type Predicate Uri
type Object string

type Triple struct {
	S Subject
	P Predicate
	O Object
}

func (t *Triple) Turtle() string {
	return fmt.Sprintf("%s %s %s .\n", t.S, t.P, t.O)
}
