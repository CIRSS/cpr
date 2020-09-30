
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
wt_path_role(r0, '/tmp', i7, nul).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i14, sw).
wt_accessed_path(e2, r0, '/bin/date', i15, sw).
wt_accessed_path(e3, r0, '/bin/cat', i16, sw).
wt_accessed_path(o31, r0, '.', i4, sw).
wt_accessed_path(o32, r0, './outputs/date.txt', i8, out).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i9, os).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i11, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i12, os).
wt_accessed_path(o37, r0, '/etc/localtime', i13, os).
wt_accessed_path(o43, r0, '.', i4, sw).
wt_accessed_path(o55, r0, '.', i4, sw).
wt_accessed_path(o56, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i9, os).
wt_accessed_path(o58, r0, '/etc/ld.so.cache', i11, os).
wt_accessed_path(o59, r0, '/lib/x86_64-linux-gnu/libc.so.6', i12, os).
wt_accessed_path(o60, r0, './outputs/date.txt', i8, out).
