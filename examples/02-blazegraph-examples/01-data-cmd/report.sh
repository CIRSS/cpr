#!/usr/bin/env bash

RUNNER='../common/run_report_script.sh'


bash ${RUNNER} STEP1 "Convert trace to RDF triples" << END_STEP

    # convert reprozip trace to RDF triples in Turtle format
	cpr convert -noroot -notimestamps -from reprozip -to triples -src .reprozip-trace -dest trace.ttl

    # print out the Turtle file
    cat trace.ttl

END_STEP


bash ${RUNNER} STEP2 "Prepare Blazegraph for the trace" << END_STEP

    # destroy the trace dataset if it exists in the Blazegraph instance
    blaze destroy --dataset trace --quiet

    # create the trace dataset in Blazegraph
    blaze create --dataset trace

END_STEP


bash ${RUNNER} STEP3 "Load trace into Blazegraph" << END_STEP

    # load the run trace into the trace dataset in Blazegraph
    blaze import --dataset trace --format ttl --file trace.ttl

END_STEP


bash ${RUNNER} STEP4 "Export the entire trace from Blazegraph" << END_STEP

    # export all of the triples from the trace dataset in Blazegraph
    blaze export --dataset trace --format nt | sort

END_STEP
