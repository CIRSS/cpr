#!/usr/bin/env bash


RUNNER='../common/run_report_script.sh'

bash ${RUNNER} R1 "Convert trace to RDF triples" << END_COMMAND

    # convert reprozip trace to RDF triples in Turtle format
	cpr convert -noroot -notimestamps -from reprozip -to triples -src .reprozip-trace -dest trace.ttl

    # print out the Turtle file
    cat trace.ttl

END_COMMAND

