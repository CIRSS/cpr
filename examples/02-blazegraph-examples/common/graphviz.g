
{{ macro "gv_graph" "Name" "Direction" '''
    digraph {{$Name}} {
    rankdir={{$Direction}}
''' }}

{{ macro "gv_title" "Title" '''
    fontname=Courier; fontsize=18; labelloc=t
    label="{{$Title}}"
''' }}

{{ macro "gv_end" '''
    }
''' }}

{{ macro "gv_cluster" "Name" '''
    subgraph {{ printf "cluster_%s" $Name }} { label=""; color=white; penwidth=0
    subgraph {{ printf "cluster_%s_inner" $Name }} { label=""; color=white
''' }}

{{ macro "gv_cluster_end" '''
    }}
''' }}

{{ macro "gv_labeled_node" "NodeID" "NodeLabel" '''
    "{{$NodeID}}" [label="{{$NodeLabel}}"]
''' }}

{{ macro "gv_edge" "Tail" "Head" '''
    "{{$Tail}}" -> "{{$Head}}"
''' }}

{{ macro "gv_labeled_edge" "Tail" "Head" "EdgeLabel" '''
    "{{$Tail}}" -> "{{$Head}}" [label="{{$EdgeLabel}}"]
''' }}

