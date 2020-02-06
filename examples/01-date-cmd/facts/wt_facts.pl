
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '01-date-cmd').

%---------------------------------------------------------------------------------------------------
% FACT: wt_directory(DirID, RunID, FilePath, FileIndex, DirRole).
%---------------------------------------------------------------------------------------------------
wt_directory(d1, r0, '/lib', i1, os).
wt_directory(d2, r0, '/etc', i2, os).
wt_directory(d3, r0, '/usr/lib', i3, os).
wt_directory(d4, r0, '/bin', i4, sw).
wt_directory(d5, r0, '.', i5, sw).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed(ID, FilePath, FileIndex, FileRole).
%---------------------------------------------------------------------------------------------------
wt_accessed(e1, './run.sh', i6, sw).
wt_accessed(e2, '/bin/date', i7, sw).
wt_accessed(o29, '.', i5, sw).
wt_accessed(o30, '/lib/x86_64-linux-gnu/ld-2.24.so', i8, os).
wt_accessed(o31, '/etc/ld.so.cache', i10, os).
wt_accessed(o32, '/lib/x86_64-linux-gnu/libc.so.6', i11, os).
wt_accessed(o33, '/usr/lib/locale/locale-archive', i12, os).
wt_accessed(o34, '/etc/localtime', i15, os).
