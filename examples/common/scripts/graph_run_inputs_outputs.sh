#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts/wt_facts'].
['facts/rpz_facts'].
['facts/rpz_views'].
['../common/rules/gv_rules'].
['../common/rules/wt_graph_rules'].

[user].
graph :-

    gv_graph('wt_run', 'Run Inputs and Outputs', 'LR'),

        wt_run(r0, RunName),

        wt_node_style__run,
        wt_node__run(RunName),

        gv_borderless_cluster('inputs'),
            wt_node_style__file,
            wt_nodes__run_input_files(),
        gv_cluster_end,

        gv_borderless_cluster('outputs'),
            wt_node_style__file,
            wt_nodes__run_output_files(),
        gv_cluster_end,

        wt_edges__input_files_to_run(),
        wt_edges__run_to_output_files(),

    gv_graph_end.

end_of_file.

graph.

END_XSB_STDIN
