#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts.d/trace_facts'].
['facts.d/trace_views'].
['../common/rules/gv_rules'].
['../common/rules/cpr_graph_rules'].

[user].
graph :-

    gv_graph('cpr_run', 'Processes and Data Files', 'LR'),
        gv_borderless_cluster('inputs'),
            cpr_node_style__process(),
            cpr_nodes__processes(),
            cpr_node_style__file(),
            cpr_nodes__data_files(),
            cpr_edges__processes_to_data_files(),
            cpr_edges__data_files_to_processes(),
        gv_cluster_end,
    gv_graph_end.

end_of_file.

graph.

END_XSB_STDIN
