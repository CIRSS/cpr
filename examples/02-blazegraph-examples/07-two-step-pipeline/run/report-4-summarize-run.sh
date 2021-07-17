# Summarize information about the run


    geist report --dataset traces << '__END_REPORT__'

        {{{
            {{ include "../common/graphviz.g" }}
            {{ include "../common/cpr.g" }}
        }}}

        Run summary:
        ============
        {{ with $RunInfo := (cpr_select_run_info_pair | vector) }}
            Run ID   = {{ index $RunInfo 0 }} 
            Run Name = {{ index $RunInfo 1 }}
        {{ end }}                                                   
__END_REPORT__

