
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '02-hello-go').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/proc', i1, os).
wt_path_role(r0, '/sys', i1, os).
wt_path_role(r0, '.', i2, sw).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(ID, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, './run.sh', i3, sw).
wt_accessed_path(e2, './bin/hello_go', i4, sw).
wt_accessed_path(o18, '.', i2, sw).
wt_accessed_path(o19, './bin/hello_go', i4, sw).
wt_accessed_path(o20, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', i6, os).
wt_accessed_path(o21, '.', i2, sw).
wt_accessed_path(o22, '.', i2, sw).
wt_accessed_path(o23, '.', i2, sw).
wt_accessed_path(o24, '.', i2, sw).
wt_accessed_path(o25, '/proc/self/exe', i10, os).
