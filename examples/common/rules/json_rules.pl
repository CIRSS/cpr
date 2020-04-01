comma :-
    write(',').

json_start() :-
    nl, write('{').

json_end() :-
    nl, write('}').

json_array_start(Name) :-
    nl, fmt_write('"%S":[', args(Name)).

json_array_end() :-
    nl, write(']').

json_property(Name, Value) :-
    nl, fmt_write('"%S":"%S"', args(Name, Value)).

