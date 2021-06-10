#!/usr/bin/env bash

RUNNER='../common/run_report_script.sh'


bash ${RUNNER} STEP1 "Convert trace to RDF triples" << END_STEP

    # convert reprozip trace to RDF triples in Turtle format
	cpr convert -noroot -notimestamps -from reprozip -to triples -src .reprozip-trace -dest trace.ttl

    # print out the Turtle file
    cat trace.ttl

END_STEP


bash ${RUNNER} STEP2 "Prepare the traces dataset in Blazegraph" << END_STEP

    # destroy the traces dataset if it exists in the Blazegraph instance
    blaze destroy --dataset traces --silent

    # create the traces dataset in Blazegraph
    blaze create --dataset traces

END_STEP


bash ${RUNNER} STEP3 "Load the trace into Blazegraph" << END_STEP

    # load the run trace into the traces dataset in Blazegraph
    blaze import --dataset traces --format ttl --file trace.ttl

END_STEP


bash ${RUNNER} STEP4 "Export the entire traces dataset from Blazegraph" << END_STEP

    # export all of the triples from the traces dataset in Blazegraph
    blaze export --dataset traces --format nt | sort

END_STEP
