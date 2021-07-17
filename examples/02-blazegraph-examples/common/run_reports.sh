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
			?execution rdf:type os:Execution .
			?execution os:resourcePath ?resource .
            ?resource os:relativePath ?program .
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
            ?access os:resourcePath ?resource .
            ?resource os:relativePath ?file .
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
            ?access os:resourcePath ?resource .
            ?resource os:relativePath ?file .
            ?access os:resourceRole ?role .
        } ORDER BY ?writer ?file ?role

__END_QUERY__

END_STEP

bash ${RUNNER} query-4-select-run-info "Show metadata about the run" << END_STEP

    echo "Show metadata about the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>
        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT ?run ?name
        WHERE {
            ?run cpr:RunName ?name .
        } ORDER BY ?name

__END_QUERY__

END_STEP


bash ${RUNNER} report-4-summarize-run "Summarize information about the run" << 'END_STEP'


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
        {{ end }}                                                   \

__END_REPORT__

END_STEP


bash ${GRAPHER} graph-1-run-inputs-and-oututs "Visualize run with run inputs and outputs"  << '__END_GRAPH__'

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

__END_GRAPH__


bash ${GRAPHER} graph-2-run-processes-and-data-files "Visualize run processes and data files"  << '__END_GRAPH__'

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

__END_GRAPH__

