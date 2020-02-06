
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '02-hello-go').

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed(ID, FilePath, FileIndex).
%---------------------------------------------------------------------------------------------------
wt_accessed(e1, './run.sh', i3).
wt_accessed(e2, './bin/hello_go', i4).
wt_accessed(o18, '.', i2).
wt_accessed(o19, './bin/hello_go', i4).
wt_accessed(o20, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', i6).
wt_accessed(o21, '.', i2).
wt_accessed(o22, '.', i2).
wt_accessed(o23, '.', i2).
wt_accessed(o24, '.', i2).
wt_accessed(o25, '.', i2).
wt_accessed(o26, '/proc/self/exe', i10).

%---------------------------------------------------------------------------------------------------
% FACT: wt_directory(DirID, RunID, DirType, FilePath, FileIndex).
%---------------------------------------------------------------------------------------------------
wt_directory(d1, r0, os, '/proc', i1).
wt_directory(d2, r0, os, '/sys', i1).
wt_directory(d3, r0, sw, '.', i2).
