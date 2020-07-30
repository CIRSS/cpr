comma :-
    write(',').

json_start_object() :-
    nl, write('{').

json_key(Name) :-
    nl, fmt_write('"%S" : ', args(Name)).

json_end() :-
    nl, write('}').

json_array_start(Name) :-
    nl, fmt_write('"%S":[', args(Name)).

json_array_end() :-
    nl, write(']').

json_property(Name, Value) :-
    nl, fmt_write('"%S":"%S"', args(Name, Value)).


json_single_property_object(Name, Value) :-
    nl, fmt_write('{ "%S": "%S" }', args(Name, Value)).

json_comma_init(Value) :-
    assertz(comma(Value)).

json_comma() :-
    comma(Comma),
    write(Comma),
    retract(comma(Comma)),
    assertz(comma(',')).

