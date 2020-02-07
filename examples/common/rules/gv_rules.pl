gv_graph(Name, Title, Layout) :-
    nl,
    fmt_write('digraph %S {',                           args(Name)), nl,
    fmt_write('rankdir=%S',                             args(Layout)), nl,
    fmt_write('fontname=%S; fontsize=%S; labelloc=%S',  args('Courier', 18, t)), nl,
    fmt_write('label="%S"',                             args(Title)), nl.

gv_graph_end() :-
    write('}'), nl, nl.

gv_borderless_cluster(Name) :-
    gv_cluster(Name, white, 0).

gv_cluster(Name, Color, Penwidth) :-
    fmt_write('subgraph cluster_%S { label=%S; color=%S; penwidth=%S',  args(Name, '""', Color, Penwidth)), nl,
    fmt_write('subgraph cluster_%S_inner { label=%S; color=white',      args(Name, '""')), nl.

gv_cluster_end() :-
    write('}}'), nl.

gv_nodestyle(Shape, Style, Fillcolor, Peripheries, Fontname) :-
    fmt_write('node[shape=%S style="%S" fillcolor="%S" peripheries=%S fontname=%S]',
               args(Shape, Style, Fillcolor, Peripheries, Fontname)), nl.

gv_nodestyle(Shape, Fillcolor, Peripheries, Width) :-
    fmt_write('node[shape=%S fillcolor="%S" peripheries=%S width=%S]',
               args(Shape, Fillcolor, Peripheries, Width)), nl.

gv_labeled_node(Name) :-
    fmt_write('"%S"', args(Name)), nl.

gv_labeled_node(Name, Label) :-
    fmt_write('"%S" [label="%S"]', args(Name, Label)), nl.

gv_unlabeled_node(Name) :-
    fmt_write('%S [label=""]', args(Name)), nl.

gv_record_node(Name, TopText, BottomText) :-
    fmt_write('%S [shape=record rankdir=LR label="{<f0> %S |<f1> %S}"]',
               args(Name, TopText, BottomText)), nl.

gv_unlabeled_edge(From, To) :-
    fmt_write('"%S" -> "%S"', args(From, To)), nl.
