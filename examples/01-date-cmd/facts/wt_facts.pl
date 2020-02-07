
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '01-date-cmd').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i2, nil).
wt_accessed_path(e2, r0, '/bin/date', i3, nil).
wt_accessed_path(o29, r0, '.', i1, nil).
wt_accessed_path(o30, r0, '/lib/x86_64-linux-gnu/ld-2.24.so', i5, nil).
wt_accessed_path(o31, r0, '/etc/ld.so.cache', i8, nil).
wt_accessed_path(o32, r0, '/lib/x86_64-linux-gnu/libc.so.6', i10, nil).
wt_accessed_path(o33, r0, '/usr/lib/locale/locale-archive', i11, nil).
wt_accessed_path(o34, r0, '/etc/localtime', i15, nil).
