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

        wt_nodestyle__process,
        wt_node__run(),

        gv_cluster('inputs', 'white'),
            wt_node_style__data,
            wt_nodes__run_inputs(),
        gv_cluster_end,

        gv_cluster('outputs', 'white'),
            wt_node_style__data,
            wt_nodes__run_outputs(),
        gv_cluster_end,

        wt_edges__inputs_to_run(),
        wt_edges__run_to_outputs(),

    gv_graph_end.

end_of_file.

graph.

END_XSB_STDIN
