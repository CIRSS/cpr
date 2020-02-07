
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '03-hello-c').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '.', i3, sw).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(ID, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, './run.sh', i4, sw).
wt_accessed_path(e2, './bin/hello_c', i5, sw).
wt_accessed_path(o18, '.', i3, sw).
wt_accessed_path(o19, './bin/hello_c', i5, sw).
wt_accessed_path(o20, '/lib/x86_64-linux-gnu/ld-2.24.so', i7, os).
wt_accessed_path(o21, '/etc/ld.so.cache', i9, os).
wt_accessed_path(o22, '/lib/x86_64-linux-gnu/libc.so.6', i10, os).
