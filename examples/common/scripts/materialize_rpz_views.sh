#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['facts.d/wt_facts'].
['facts.d/rpz_facts'].
['../common/rules/general_rules'].
['../common/rules/rpz_view_rules'].

set_prolog_flag(unknown, fail).

rule_banner('wt_process(ProcessID, ParentID, ExecID, ExecPath).').
printall(wt_process(_,_,_,_)).

rule_banner('wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).').
printall(wt_file_read(_,_,_,_,_,_)).

rule_banner('wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).').
printall(wt_file_write(_,_,_,_,_,_)).

rule_banner('wt_data_file(PathIndex, FilePath, PathRole).').
printall(wt_data_file(_,_,_)).

END_XSB_STDIN
