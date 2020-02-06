
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '01-date-cmd').

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed(ID, FilePath, FileIndex).
%---------------------------------------------------------------------------------------------------
wt_accessed(e1, './run.sh', i6).
wt_accessed(e2, '/bin/date', i7).
wt_accessed(o29, '.', i5).
wt_accessed(o30, '/lib/x86_64-linux-gnu/ld-2.24.so', i8).
wt_accessed(o31, '/etc/ld.so.cache', i10).
wt_accessed(o32, '/lib/x86_64-linux-gnu/libc.so.6', i11).
wt_accessed(o33, '/usr/lib/locale/locale-archive', i12).
wt_accessed(o34, '/etc/localtime', i15).

%---------------------------------------------------------------------------------------------------
% FACT: wt_directory(DirID, RunID, DirType, FilePath, FileIndex).
%---------------------------------------------------------------------------------------------------
wt_directory(d1, r0, os, '/lib', i1).
wt_directory(d2, r0, os, '/etc', i2).
wt_directory(d3, r0, os, '/usr/lib', i3).
wt_directory(d4, r0, sw, '/bin', i4).
wt_directory(d5, r0, sw, '.', i5).
