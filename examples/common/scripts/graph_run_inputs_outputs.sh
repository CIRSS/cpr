#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts/rpz_facts'].
['views/rpz_views'].
['../common/rules/gv_rules'].
['../common/rules/wt_graph_rules'].

[user].
graph :-

    gv_graph('wt_run', 'Run Inputs and Outputs', 'LR'),
    gv_graph_end.

end_of_file.

graph.

END_XSB_STDIN
