
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '05-cat-file-to-file').

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
wt_accessed_path(e2, r0, '/bin/cat', i9, sw).
wt_accessed_path(o31, r0, '.', i4, sw).
wt_accessed_path(o32, r0, './outputs/output.txt', i10, out).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i11, os).
wt_accessed_path(o34, r0, '/tmp/_MEIYshZgV', i0, nil).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i14, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i15, os).
wt_accessed_path(o37, r0, './inputs/input.txt', i16, in).
