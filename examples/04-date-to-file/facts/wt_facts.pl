
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '04-date-to-file').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '/usr/lib', i3, os).
wt_path_role(r0, '.', i4, sw).
wt_path_role(r0, '/bin', i5, sw).
wt_path_role(r0, 'outputs', i6, out).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(ID, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, './run.sh', i7, sw).
wt_accessed_path(e2, '/bin/date', i8, sw).
wt_accessed_path(e3, '/bin/cat', i9, sw).
wt_accessed_path(o29, '.', i4, sw).
wt_accessed_path(o30, './outputs/date.txt', i10, out).
wt_accessed_path(o31, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed_path(o32, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o33, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o34, '/usr/lib/locale/locale-archive', i15, os).
wt_accessed_path(o35, '/etc/localtime', i18, os).
wt_accessed_path(o36, '.', i4, sw).
wt_accessed_path(o48, '.', i4, sw).
wt_accessed_path(o49, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed_path(o50, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o51, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o52, '/usr/lib/locale/locale-archive', i15, os).
wt_accessed_path(o53, './outputs/date.txt', i10, out).
