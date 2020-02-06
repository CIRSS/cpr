
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '05-cat-file-to-file').

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed(ID, FilePath, FileIndex).
%---------------------------------------------------------------------------------------------------
wt_accessed(e1, './run.sh', i8).
wt_accessed(e2, '/bin/cat', i9).
wt_accessed(o29, '.', i4).
wt_accessed(o30, './outputs/output.txt', i10).
wt_accessed(o31, '/lib/x86_64-linux-gnu/ld-2.24.so', i11).
wt_accessed(o32, '/etc/ld.so.cache', i13).
wt_accessed(o33, '/lib/x86_64-linux-gnu/libc.so.6', i14).
wt_accessed(o34, '/usr/lib/locale/locale-archive', i15).
wt_accessed(o35, './inputs/input.txt', i18).

%---------------------------------------------------------------------------------------------------
% FACT: wt_directory(DirID, RunID, DirType, FilePath, FileIndex).
%---------------------------------------------------------------------------------------------------
wt_directory(d1, r0, os, '/lib', i1).
wt_directory(d2, r0, os, '/etc', i2).
wt_directory(d3, r0, os, '/usr/lib', i3).
wt_directory(d4, r0, sw, '.', i4).
wt_directory(d5, r0, sw, '/bin', i5).
wt_directory(d6, r0, in, './inputs', i6).
wt_directory(d7, r0, out, './outputs', i7).
