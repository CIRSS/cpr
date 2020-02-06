#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['facts/rpz_facts'].
['../common/rules/general_rules'].
['../common/rules/rpz_views'].

set_prolog_flag(unknown, fail).

rule_banner('wt_file_read(AccessID, ProcessID, FileIndex, FilePath).').
printall(wt_file_read(_,_,_,_)).

rule_banner('wt_file_write(AccessID, ProcessID, FileIndex, FilePath).').
printall(wt_file_write(_,_,_,_)).


END_XSB_STDIN
