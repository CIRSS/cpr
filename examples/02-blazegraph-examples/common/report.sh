#!/usr/bin/env bash

RUNNER='../common/do_report_step.sh'
GRAPHER='../common/do_report_graph.sh'

bash ${RUNNER} STEP1 "Convert trace to RDF triples" << END_STEP

    # convert Reprozip reprozip trace to RDF triples in Turtle format
	cpr convert -noroot -notimestamps -from reprozip -to triples -src .reprozip-trace -dest ./cpr/trace.ttl

    # print out the Turtle file
    cat ./cpr/trace.ttl

END_STEP


bash ${RUNNER} STEP2 "Prepare the traces dataset in Blazegraph" << END_STEP

    # destroy the traces dataset if it exists in the Blazegraph instance
    blaze destroy --dataset traces --silent

    # create the traces dataset in Blazegraph
    blaze create --dataset traces

END_STEP


bash ${RUNNER} STEP3 "Load the trace into Blazegraph" << END_STEP

    # load the run trace into the traces dataset in Blazegraph
    blaze import --dataset traces --format ttl --file cpr/trace.ttl

END_STEP


bash ${RUNNER} STEP4 "Export the entire traces dataset from Blazegraph" << END_STEP

    # export all of the triples from the traces dataset in Blazegraph
    blaze export --dataset traces --format nt | sort

END_STEP


bash ${RUNNER} Q1 "List the programs executed during the run" << END_STEP

    echo "Programs executed during the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>

        SELECT DISTINCT ?program
        WHERE {
            ?execution cpr:ExecFile ?program .
        } ORDER BY ?program

__END_QUERY__

END_STEP


bash ${RUNNER} Q2 "List the files opened for reading during the run" << END_STEP

    echo "Programs opened for reading during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>

        SELECT DISTINCT ?file ?role
        WHERE {
            ?access rdf:type cpr:FileAccess .
            ?access cpr:AccessMode cpr:Read .
            ?access cpr:FilePath ?file .
            ?access cpr:FileRole ?role .
    } ORDER BY ?file ?role

__END_QUERY__

END_STEP



