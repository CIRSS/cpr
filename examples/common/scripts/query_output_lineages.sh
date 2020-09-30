#!/usr/bin/env bash

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

%set_prolog_flag(unknown, fail).

['facts.d/trace_facts'].
['facts.d/trace_views'].
['../common/rules/general_rules'].

%-------------------------------------------------------------------------------
banner( 'CPR_OUTPUT_LINEAGE_Q1',
        'What is the name of the recorded run?',
        'q1_run_name(RunName).').
[user].
:- table q1_run_name/1.
q1_run_name(RunName) :-
	cpr_run(_, RunName).
end_of_file.
printall(q1_run_name(_)).
%-------------------------------------------------------------------------------

END_XSB_STDIN

echo
