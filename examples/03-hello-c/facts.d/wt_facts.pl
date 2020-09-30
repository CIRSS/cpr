
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
wt_path_role(r0, '/tmp', i4, nul).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i11, sw).
wt_accessed_path(e2, r0, './bin/hello_c', i5, sw).
wt_accessed_path(o20, r0, '.', i3, sw).
wt_accessed_path(o21, r0, './bin/hello_c', i5, sw).
wt_accessed_path(o22, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i7, os).
wt_accessed_path(o24, r0, '/etc/ld.so.cache', i9, os).
wt_accessed_path(o25, r0, '/lib/x86_64-linux-gnu/libc.so.6', i10, os).
