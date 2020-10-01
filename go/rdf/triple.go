package rdf

import (
	"fmt"
	"strconv"
)

type Subject string

func NewSubject(s interface{}) Subject {
	return Subject(s.(string))
}

type Predicate string

func NewPredicate(p interface{}) Predicate {
	return Predicate(p.(string))
}

type Object string

func NewObject(o interface{}) (obj Object) {
	switch o.(type) {
	case string:
		obj = Object(o.(string))
	case int64:
		obj = Object(strconv.FormatInt(o.(int64), 10))
	}
	return
}

type Triple struct {
	S Subject
	P Predicate
	O Object
}

func (t *Triple) Turtle() string {
	return fmt.Sprintf("%s %s %s .\n", t.S, t.P, t.O)
}
