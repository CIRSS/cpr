
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

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i9, sw).
wt_accessed_path(e2, r0, '/bin/cat', i10, sw).
wt_accessed_path(e3, r0, '/bin/cat', i10, sw).
wt_accessed_path(o32, r0, '.', i4, sw).
wt_accessed_path(o33, r0, './temp/file2.txt', i11, tmp).
wt_accessed_path(o34, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i12, os).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i14, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i15, os).
wt_accessed_path(o37, r0, '/usr/lib/locale/C.UTF-8/LC_CTYPE', i16, os).
wt_accessed_path(o38, r0, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', i20, os).
wt_accessed_path(o39, r0, './inputs/file1.txt', i23, in).
wt_accessed_path(o45, r0, '.', i4, sw).
wt_accessed_path(o46, r0, './outputs/file3.txt', i24, out).
wt_accessed_path(o47, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i12, os).
wt_accessed_path(o48, r0, '/etc/ld.so.cache', i14, os).
wt_accessed_path(o49, r0, '/lib/x86_64-linux-gnu/libc.so.6', i15, os).
wt_accessed_path(o50, r0, '/usr/lib/locale/C.UTF-8/LC_CTYPE', i16, os).
wt_accessed_path(o51, r0, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', i20, os).
wt_accessed_path(o52, r0, './temp/file2.txt', i11, tmp).
