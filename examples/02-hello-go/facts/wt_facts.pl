
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
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i3, sw).
wt_accessed_path(e2, r0, './bin/hello_go', i4, sw).
wt_accessed_path(o22, r0, '.', i2, sw).
wt_accessed_path(o23, r0, './bin/hello_go', i4, sw).
wt_accessed_path(o24, r0, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', i6, os).
wt_accessed_path(o25, r0, '.', i2, sw).
wt_accessed_path(o26, r0, '.', i2, sw).
wt_accessed_path(o27, r0, '.', i2, sw).
wt_accessed_path(o28, r0, '.', i2, sw).
wt_accessed_path(o29, r0, '/proc/self/exe', i10, os).
