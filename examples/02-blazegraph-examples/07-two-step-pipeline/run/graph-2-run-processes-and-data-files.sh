# Visualize run processes and data files

geist report --dataset traces << '__END_REPORT__'

    {{{
        {{ include "../common/graphviz.g" }}
        {{ include "../common/cpr.g" }}
    }}}

    {{ gv_graph "cpr_run" "LR" }}
    {{ gv_title "Run Processes and Data Files" }}

    {{ gv_cluster "dataflow_graph" }}

    # data file nodes
    {{ os_file_node_style }}
    {{ cpr_data_file_nodes }}

    # nodes for processes that read or write data files
    {{ os_process_node_style }}
    {{ cpr_data_io_process_nodes }}

    # process input file edges
    {{ cpr_process_input_file_edges }}

    # process output file edges
    {{ cpr_process_output_file_edges }}

    {{ gv_cluster_end }}                                                                            

    {{ gv_end }}                                                                            

__END_REPORT__

