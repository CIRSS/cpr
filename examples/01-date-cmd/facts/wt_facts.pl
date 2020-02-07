
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '01-date-cmd').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '/usr/lib', i3, os).
wt_path_role(r0, '/bin', i4, sw).
wt_path_role(r0, '.', i5, sw).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i6, sw).
wt_accessed_path(e2, r0, '/bin/date', i7, sw).
wt_accessed_path(o29, r0, '.', i5, sw).
wt_accessed_path(o30, r0, '/lib/x86_64-linux-gnu/ld-2.24.so', i8, os).
wt_accessed_path(o31, r0, '/etc/ld.so.cache', i10, os).
wt_accessed_path(o32, r0, '/lib/x86_64-linux-gnu/libc.so.6', i11, os).
wt_accessed_path(o33, r0, '/usr/lib/locale/locale-archive', i12, os).
wt_accessed_path(o34, r0, '/etc/localtime', i15, os).
