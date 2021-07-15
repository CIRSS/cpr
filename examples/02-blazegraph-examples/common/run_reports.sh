#!/usr/bin/env bash

RUNNER='../common/do_report_step.sh'
GRAPHER='../common/do_report_graph.sh'

bash ${RUNNER} step-1-convert-trace-to-rdf "Convert the ReproZip trace to RDF triples" << __END_STEP__

    # convert Reprozip reprozip trace to RDF triples in Turtle format
	cpr convert -name=`basename $(pwd)` -noroot -notimestamps -from reprozip -to triples -src ./run/.reprozip-trace -dest ./run/.scratch/trace.ttl

    # print out the Turtle file
    cat ./run/.scratch/trace.ttl

__END_STEP__


bash ${RUNNER} step-2-load-traces-dataset "Load the Turtle-formatted trace into Blazegraph" << END_STEP

    # destroy the traces dataset if it exists in the Blazegraph instance
    blaze destroy --dataset traces --silent

    # create the traces dataset in Blazegraph
    blaze create --dataset traces

    # load the run trace into the traces dataset in Blazegraph
    blaze import --dataset traces --format ttl --file run/.scratch/trace.ttl

END_STEP


bash ${RUNNER} step-3-export-ntriples "Export the trace from Blazegraph as N-Triples" << END_STEP

    # export all of the triples from the traces dataset in Blazegraph
    blaze export --dataset traces --format nt | sort

END_STEP


bash ${RUNNER} query-1-select-executed-programs "List the programs executed during the run" << END_STEP

    echo "Programs executed during the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT DISTINCT ?program
        WHERE {
            ?execution os:executedFile ?program .
        } ORDER BY ?program

__END_QUERY__

END_STEP


bash ${RUNNER} query-2-select-files-read "List the files opened for reading during the run" << END_STEP

    echo "Files opened for reading during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>
        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT DISTINCT ?reader ?file ?role
        WHERE {
            ?access rdf:type os:FileAccess .
            ?access os:accessMode cpr:Read .
            ?process os:performedAccess ?access.
            ?exec os:startedProcess ?process .
            ?exec os:executedFile ?reader .
            ?access os:accessPath ?file .
            ?access os:resourceRole ?role .

    } ORDER BY ?reader ?file ?role

__END_QUERY__

END_STEP

bash ${RUNNER} query-3-select-files-written "List the files opened for writing during the run" << END_STEP

    echo "Files opened for writing during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>
        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT DISTINCT ?writer ?file ?role
        WHERE {
            ?access rdf:type os:FileAccess .
            ?access os:accessMode cpr:Write .
            ?process os:performedAccess ?access.
            ?exec os:startedProcess ?process .
            ?exec os:executedFile ?writer .
            ?access os:accessPath ?file .
            ?access os:resourceRole ?role .
        } ORDER BY ?writer ?file ?role

__END_QUERY__

END_STEP


bash ${GRAPHER} graph-1 "BLACKBOX VIEW OF RUN"  << '__END_GRAPH__'

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

    {{ gv_end }}                                                                            \\

__END_REPORT__

__END_GRAPH__



