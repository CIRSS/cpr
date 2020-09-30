
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '07-two-step-pipeline').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '/usr/lib', i3, os).
wt_path_role(r0, '.', i4, sw).
wt_path_role(r0, '/bin', i5, sw).
wt_path_role(r0, './inputs', i6, in).
wt_path_role(r0, './outputs', i7, out).
wt_path_role(r0, './temp', i8, tmp).
wt_path_role(r0, '/tmp', i9, nul).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i17, sw).
wt_accessed_path(e2, r0, '/bin/cat', i18, sw).
wt_accessed_path(e3, r0, '/bin/cat', i18, sw).
wt_accessed_path(o31, r0, '.', i4, sw).
wt_accessed_path(o32, r0, './temp/file2.txt', i10, tmp).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o37, r0, './inputs/file1.txt', i15, in).
wt_accessed_path(o43, r0, '.', i4, sw).
wt_accessed_path(o44, r0, './outputs/file3.txt', i16, out).
wt_accessed_path(o45, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o47, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o48, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o49, r0, './temp/file2.txt', i10, tmp).
