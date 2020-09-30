#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts.d/trace_facts'].
['facts.d/trace_views'].
['../common/rules/gv_rules'].
['../common/rules/cpr_graph_rules'].

[user].
graph :-

    gv_graph('cpr_run', 'Run Inputs and Outputs', 'LR'),

        cpr_run(r0, RunName),

        cpr_node_style__run,
        cpr_node__run(RunName),

        gv_borderless_cluster('inputs'),
            cpr_node_style__file,
            cpr_nodes__run_input_files(),
        gv_cluster_end,

        gv_borderless_cluster('outputs'),
            cpr_node_style__file,
            cpr_nodes__run_output_files(),
        gv_cluster_end,

        cpr_edges__input_files_to_run(),
        cpr_edges__run_to_output_files(),

    gv_graph_end.

end_of_file.

graph.

END_XSB_STDIN
