

%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o31,r0,p2,i7,'/lib/x86_64-linux-gnu/ld-2.24.so',nil).
wt_file_read(o32,r0,p2,i10,'/etc/ld.so.cache',nil).
wt_file_read(o33,r0,p2,i12,'/lib/x86_64-linux-gnu/libc.so.6',nil).
wt_file_read(o34,r0,p2,i13,'/usr/lib/locale/locale-archive',nil).
wt_file_read(o35,r0,p2,i17,'./inputs/input.txt',nil).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o30,r0,p2,i5,'./outputs/output.txt',nil).
