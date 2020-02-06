
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '02-hello-go').

%---------------------------------------------------------------------------------------------------
% FACT: wt_directory(DirID, RunID, FilePath, FileIndex, DirRole).
%---------------------------------------------------------------------------------------------------
wt_directory(d1, r0, '/proc', i1, os).
wt_directory(d2, r0, '/sys', i1, os).
wt_directory(d3, r0, '.', i2, sw).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed(ID, FilePath, FileIndex, FileRole).
%---------------------------------------------------------------------------------------------------
wt_accessed(e1, './run.sh', i3, sw).
wt_accessed(e2, './bin/hello_go', i4, sw).
wt_accessed(o18, '.', i2, sw).
wt_accessed(o19, './bin/hello_go', i4, sw).
wt_accessed(o20, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', i6, os).
wt_accessed(o21, '.', i2, sw).
wt_accessed(o22, '.', i2, sw).
wt_accessed(o23, '.', i2, sw).
wt_accessed(o24, '.', i2, sw).
wt_accessed(o25, '.', i2, sw).
wt_accessed(o26, '/proc/self/exe', i10, os).
