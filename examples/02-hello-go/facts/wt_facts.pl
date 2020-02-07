
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '02-hello-go').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i2, nil).
wt_accessed_path(e2, r0, './bin/hello_go', i3, nil).
wt_accessed_path(o18, r0, '.', i1, nil).
wt_accessed_path(o19, r0, './bin/hello_go', i3, nil).
wt_accessed_path(o20, r0, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', i5, nil).
wt_accessed_path(o21, r0, '.', i1, nil).
wt_accessed_path(o22, r0, '.', i1, nil).
wt_accessed_path(o23, r0, '.', i1, nil).
wt_accessed_path(o24, r0, '.', i1, nil).
wt_accessed_path(o25, r0, '.', i1, nil).
wt_accessed_path(o26, r0, '/proc/self/exe', i10, nil).
