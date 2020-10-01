package rdf

import "strconv"

type Object struct {
	value     interface{}
	valueType string
}

func (g *Graph) NewObject(o interface{}) (obj Object) {
	switch o.(type) {
	case Uri:
		obj = Object{o, "uri"}
	case string:
		obj = Object{o, "string"}
	case int64:
		obj = Object{strconv.FormatInt(o.(int64), 10), "int"}
	}
	return
}

func (o Object) String() (s string) {
	switch o.valueType {
	case "uri":
		s = o.value.(Uri).String()
	case "string":
		s = `"` + o.value.(string) + `"`
	case "int":
		s = o.value.(string)
	}
	return
}
