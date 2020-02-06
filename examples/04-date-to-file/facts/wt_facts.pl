
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '04-date-to-file').

%---------------------------------------------------------------------------------------------------
% FACT: wt_directory(DirID, RunID, FilePath, FileIndex, DirRole).
%---------------------------------------------------------------------------------------------------
wt_directory(d1, r0, '/lib', i1, os).
wt_directory(d2, r0, '/etc', i2, os).
wt_directory(d3, r0, '/usr/lib', i3, os).
wt_directory(d4, r0, '.', i4, sw).
wt_directory(d5, r0, '/bin', i5, sw).
wt_directory(d6, r0, 'outputs', i6, out).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed(ID, FilePath, FileIndex, FileRole).
%---------------------------------------------------------------------------------------------------
wt_accessed(e1, './run.sh', i7, sw).
wt_accessed(e2, '/bin/date', i8, sw).
wt_accessed(e3, '/bin/cat', i9, sw).
wt_accessed(o29, '.', i4, sw).
wt_accessed(o30, './outputs/date.txt', i10, out).
wt_accessed(o31, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed(o32, '/etc/ld.so.cache', i13, os).
wt_accessed(o33, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed(o34, '/usr/lib/locale/locale-archive', i15, os).
wt_accessed(o35, '/etc/localtime', i18, os).
wt_accessed(o36, '.', i4, sw).
wt_accessed(o48, '.', i4, sw).
wt_accessed(o49, '/lib/x86_64-linux-gnu/ld-2.24.so', i11, os).
wt_accessed(o50, '/etc/ld.so.cache', i13, os).
wt_accessed(o51, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed(o52, '/usr/lib/locale/locale-archive', i15, os).
wt_accessed(o53, './outputs/date.txt', i10, out).
