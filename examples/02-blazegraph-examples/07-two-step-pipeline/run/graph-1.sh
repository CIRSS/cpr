# BLACKBOX VIEW OF RUN

geist report --dataset traces << '__END_REPORT__'

    {{{
        {{ include "../common/cpr.g" }}
        {{ include "../common/graphviz.g" }}
    }}}

    {{ gv_graph "cpr_run" "LR" }}
    {{ gv_title "Run Inputs and Outputs" }}

    {{ cpr_run_node_style }}
    {{ gv_labeled_node "run" ( cpr_select_run_info | value ) }}

    {{ gv_cluster "input_files" }}
        {{ os_file_node_style }}
        {{ range $Row := cpr_select_input_files | rows }}
            {{ gv_labeled_node (index $Row 0) (index $Row 0) }}
        {{ end }}
    {{ gv_cluster_end}}

    {{ range $Row := cpr_select_input_files | rows }}
        {{ gv_edge (index $Row 0) "run" }}
    {{ end }}

    {{ gv_cluster "output_files" }}
        {{ os_file_node_style }}
        {{ range $Row := cpr_select_output_files | rows }}
            {{ gv_labeled_node (index $Row 0) (index $Row 0) }}
        {{ end }}
    {{ gv_cluster_end }}

    {{ range $Row := cpr_select_output_files | rows }}
        {{ gv_edge "run" (index $Row 0) }}
    {{ end }}

    {{ gv_end }}                                                                            \

__END_REPORT__

