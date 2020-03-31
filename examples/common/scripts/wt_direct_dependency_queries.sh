#!/usr/bin/env bash

ProvidedFileName=$1

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

%set_prolog_flag(unknown, fail).

['facts/wt_facts'].
['facts/rpz_facts'].
['facts/rpz_views'].
['../common/rules/general_rules'].

%-------------------------------------------------------------------------------
banner( 'Q1_DIRECT_UPSTREAM_FILE_DEPENDENCY',
        'What files does the given data file directly depend upon?',
        'q1_direct_upstream_file_dependency(File, UpstreamFile)').
[user].
:- table q1_direct_upstream_file_dependency/2.
q1_direct_upstream_file_dependency(File, UpstreamFile) :-
	wt_file_write(_, _, ProcessID, _, File, _),
    wt_file_read(_, _, ProcessID, PathIndex, UpstreamFile, _),
    wt_data_file(PathIndex, _, _).
end_of_file.
printall(q1_direct_upstream_file_dependency('$ProvidedFileName', _)).
%-------------------------------------------------------------------------------

END_XSB_STDIN

echo
