
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '08-branched-pipeline').

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
wt_accessed_path(e1, r0, './run.sh', i24, sw).
wt_accessed_path(e2, r0, '/bin/cat', i25, sw).
wt_accessed_path(e3, r0, '/bin/cat', i25, sw).
wt_accessed_path(e4, r0, '/bin/cat', i25, sw).
wt_accessed_path(e5, r0, '/bin/cat', i25, sw).
wt_accessed_path(e6, r0, '/bin/cat', i25, sw).
wt_accessed_path(e7, r0, '/bin/cat', i25, sw).
wt_accessed_path(o31, r0, '.', i4, sw).
wt_accessed_path(o32, r0, './temp/t12.txt', i10, tmp).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o37, r0, './inputs/i1.txt', i15, in).
wt_accessed_path(o38, r0, './inputs/i2.txt', i16, in).
wt_accessed_path(o44, r0, '.', i4, sw).
wt_accessed_path(o45, r0, './temp/t123.txt', i17, tmp).
wt_accessed_path(o46, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o48, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o49, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o50, r0, './inputs/i1.txt', i15, in).
wt_accessed_path(o51, r0, './inputs/i2.txt', i16, in).
wt_accessed_path(o52, r0, './inputs/i3.txt', i18, in).
wt_accessed_path(o53, r0, '.', i4, sw).
wt_accessed_path(o54, r0, './temp/t4.txt', i19, tmp).
wt_accessed_path(o55, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o57, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o58, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o59, r0, './inputs/i4.txt', i20, in).
wt_accessed_path(o60, r0, '.', i4, sw).
wt_accessed_path(o61, r0, './outputs/o12.txt', i21, out).
wt_accessed_path(o62, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o64, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o65, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o66, r0, './temp/t12.txt', i10, tmp).
wt_accessed_path(o67, r0, '.', i4, sw).
wt_accessed_path(o68, r0, './outputs/o1234.txt', i22, out).
wt_accessed_path(o69, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o71, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o72, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o73, r0, './temp/t123.txt', i17, tmp).
wt_accessed_path(o74, r0, './temp/t4.txt', i19, tmp).
wt_accessed_path(o75, r0, '.', i4, sw).
wt_accessed_path(o76, r0, './outputs/o4.txt', i23, out).
wt_accessed_path(o77, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o79, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o80, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o81, r0, './temp/t4.txt', i19, tmp).
