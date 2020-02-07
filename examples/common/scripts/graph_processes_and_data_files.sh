#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts/wt_facts'].
['facts/rpz_facts'].
['views/rpz_views'].
['../common/rules/gv_rules'].
['../common/rules/wt_graph_rules'].

[user].
graph :-

    gv_graph('wt_run', 'Processes and Data Files', 'LR'),

        wt_node_style__process(),
        wt_nodes__processes(),

        wt_node_style__file(),

    gv_graph_end.

end_of_file.

graph.

END_XSB_STDIN
