
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

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i8, sw).
wt_accessed_path(e2, r0, '/bin/mkdir', i9, sw).
wt_accessed_path(e3, r0, '/bin/cat', i10, sw).
wt_accessed_path(e4, r0, '/bin/cat', i10, sw).
wt_accessed_path(o29, r0, '.', i4, sw).
wt_accessed_path(o30, r0, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed_path(o31, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o32, r0, '/lib/x86_64-linux-gnu/libselinux.so.1', i14, os).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/libc.so.6', i15, os).
wt_accessed_path(o34, r0, '/lib/x86_64-linux-gnu/libpcre.so.3', i16, os).
wt_accessed_path(o35, r0, '/lib/x86_64-linux-gnu/libdl.so.2', i17, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libpthread.so.0', i18, os).
wt_accessed_path(o37, r0, '/proc/filesystems', i19, nil).
wt_accessed_path(o38, r0, '/usr/lib/locale/locale-archive', i21, os).
wt_accessed_path(o39, r0, './temp', i24, sw).
wt_accessed_path(o51, r0, '.', i4, sw).
wt_accessed_path(o52, r0, './temp/file2.txt', i25, sw).
wt_accessed_path(o53, r0, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed_path(o54, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o55, r0, '/lib/x86_64-linux-gnu/libc.so.6', i15, os).
wt_accessed_path(o56, r0, '/usr/lib/locale/locale-archive', i21, os).
wt_accessed_path(o57, r0, './inputs/file1.txt', i26, in).
wt_accessed_path(o58, r0, '.', i4, sw).
wt_accessed_path(o59, r0, './outputs/file3.txt', i27, out).
wt_accessed_path(o60, r0, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed_path(o61, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o62, r0, '/lib/x86_64-linux-gnu/libc.so.6', i15, os).
wt_accessed_path(o63, r0, '/usr/lib/locale/locale-archive', i21, os).
wt_accessed_path(o64, r0, './temp/file2.txt', i25, sw).
