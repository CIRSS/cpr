# Visualize run with run inputs and outputs

geist report --dataset traces << '__END_REPORT__'

    {{{
        {{ include "../common/graphviz.g" }}
        {{ include "../common/cpr.g" }}
    }}}

    {{ with $RunInfo := (cpr_select_run_info_pair | vector) }}

        {{ gv_graph "cpr_run" "LR" }}
        {{ gv_title "Run Inputs and Outputs" }}

        {{ cpr_run_node_style }}
        {{ gv_labeled_node ( index $RunInfo 0 ) ( index $RunInfo 1 ) }}

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
        {{ cpr_run_input_file_edges ( index $RunInfo 0 ) }}

        # output file edges
        {{ cpr_run_output_file_edges ( index $RunInfo 0 )}}

        {{ gv_end }}                                                                            

    {{ end }}

__END_REPORT__

