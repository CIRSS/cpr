#!/usr/bin/env bash

ProvidedFileName=$1

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

%set_prolog_flag(unknown, fail).

['facts.d/trace_facts'].
['facts.d/trace_views'].
['../common/rules/general_rules'].

%-------------------------------------------------------------------------------
banner( 'Q1_DIRECT_UPSTREAM_FILE_DEPENDENCY',
        'What files does the given data file directly depend upon?',
        'q1_direct_upstream_file_dependency(File, UpstreamFile)').
[user].
:- table q1_direct_upstream_file_dependency/2.
q1_direct_upstream_file_dependency(File, UpstreamFile) :-
	cpr_file_write(_, _, ProcessID, _, File, _),
    cpr_file_read(_, _, ProcessID, PathIndex, UpstreamFile, _),
    cpr_data_file(PathIndex, _, _).
end_of_file.
printall(q1_direct_upstream_file_dependency('$ProvidedFileName', _)).
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
banner( 'Q2_DIRECT_DOWNSTREAM_FILE_DEPENDENCY',
        'What files depend directly on the given data file?',
        'q2_direct_downstream_file_dependency(File, DownstreamFile)').
[user].
:- table q2_direct_downstream_file_dependency/2.
q2_direct_downstream_file_dependency(File, DownstreamFile) :-
    cpr_file_read(_, _, ProcessID, _, File, _),
	cpr_file_write(_, _, ProcessID, _, DownstreamFile, _).
end_of_file.
printall(q2_direct_downstream_file_dependency('$ProvidedFileName', _)).
%-------------------------------------------------------------------------------
END_XSB_STDIN

echo
