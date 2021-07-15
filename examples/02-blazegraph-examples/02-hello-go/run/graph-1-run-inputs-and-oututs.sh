# Visualize run with run inputs and outputs

geist report --dataset traces << '__END_REPORT__'

    {{{
        {{ include "../common/graphviz.g" }}
        {{ include "../common/cpr.g" }}
    }}}

    {{ gv_graph "cpr_run" "LR" }}
    {{ gv_title "Run Inputs and Outputs" }}

    {{ cpr_run_node_style }}
    {{ gv_labeled_node "run" ( cpr_select_run_info | value ) }}

    {{ os_file_node_style }}

    # input file nodes
    {{ gv_cluster "input_files" }}
        {{ cpr_run_input_file_nodes }}
    {{ gv_cluster_end}}

    # output file nodes
    {{ gv_cluster "output_files" }}
        {{ cpr_run_output_file_nodes }}
    {{ gv_cluster_end }}

    # input file edges
    {{ cpr_run_input_file_edges }}

    # output file edges
    {{ cpr_run_output_file_edges }}

    {{ gv_end }}                                                                            

__END_REPORT__

