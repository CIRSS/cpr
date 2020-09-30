

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p2,p1,e2,'/usr/bin/cat').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o33,r0,p2,i9,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
wt_file_read(o35,r0,p2,i12,'/etc/ld.so.cache',os).
wt_file_read(o36,r0,p2,i13,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o37,r0,p2,i14,'./inputs/input.txt',in).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o32,r0,p2,i8,'./outputs/output.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i14,'./inputs/input.txt',in).
wt_data_file(i8,'./outputs/output.txt',out).
