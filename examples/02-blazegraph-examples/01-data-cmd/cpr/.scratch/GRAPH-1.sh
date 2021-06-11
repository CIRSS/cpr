# DATAFRAME FLOW THROUGH COMMANDS

geist report << '__END_REPORT_TEMPLATE__'

    {{{
        {{ include "../common/graphviz.g" }}
    }}}

    {{ gv_graph "run_blackbox" }}

    {{ gv_title "Black-box view of run" }}

    {{ gv_end }}                                                                            \

__END_REPORT_TEMPLATE__

