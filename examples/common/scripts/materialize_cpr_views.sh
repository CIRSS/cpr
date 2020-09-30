#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['facts.d/trace_facts'].
['../common/rules/general_rules'].
['../common/rules/cpr_view_rules'].

set_prolog_flag(unknown, fail).

rule_banner('cpr_process(ProcessID, ParentID, ExecID, ExecPath).').
printall(cpr_process(_,_,_,_)).

rule_banner('cpr_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).').
printall(cpr_file_read(_,_,_,_,_,_)).

rule_banner('cpr_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).').
printall(cpr_file_write(_,_,_,_,_,_)).

rule_banner('cpr_data_file(PathIndex, FilePath, PathRole).').
printall(cpr_data_file(_,_,_)).

END_XSB_STDIN
