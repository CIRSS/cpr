#!/usr/bin/env bash

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

%set_prolog_flag(unknown, fail).

['facts/wt_facts'].
['facts/rpz_facts'].
['facts/rpz_views'].
['../common/rules/general_rules'].

%-------------------------------------------------------------------------------
banner( 'WT_Q1',
        'What is the name of the recorded run?',
        'q1_run_name(RunName).').
[user].
:- table q1_run_name/1.
q1_run_name(RunName) :-
	wt_run(_, RunName).
end_of_file.
printall(q1_run_name(_)).
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
banner( 'WT_Q2',
        'What data files were input to the run?',
        'q2_run_input_file(FileName).').
[user].
:- table q2_run_input_file/1.
q2_run_input_file(FileName) :-
	wt_accessed_path(_, _, FileName, _, in).
end_of_file.
printall(q2_run_input_file(_)).
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
banner( 'WT_Q3',
        'What data files were output by the run?',
        'q3_run_output_file(FileName).').
[user].
:- table q3_run_output_file/1.
q3_run_output_file(FileName) :-
	wt_accessed_path(_, _, FileName, _, out).
end_of_file.
printall(q3_run_output_file(_)).
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
banner( 'WT_Q4',
        'What programs and scripts were executed during the run?',
        'q4_executed_file(FileName).').
[user].
:- table q4_executed_file/1.
q4_executed_file(FileName) :-
	rpz_execution(ExecID, _, _, _, _, _),
	wt_accessed_path(ExecID, _, FileName, _, _).
end_of_file.
printall(q4_executed_file(_)).
%-------------------------------------------------------------------------------


END_XSB_STDIN

echo
