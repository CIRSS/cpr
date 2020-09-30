

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p3,p1,e3,'/usr/bin/cat').
wt_process(p2,p1,e2,'/usr/bin/cat').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o33,r0,p2,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
wt_file_read(o35,r0,p2,i13,'/etc/ld.so.cache',os).
wt_file_read(o36,r0,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o37,r0,p2,i15,'./inputs/file1.txt',in).
wt_file_read(o45,r0,p3,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
wt_file_read(o47,r0,p3,i13,'/etc/ld.so.cache',os).
wt_file_read(o48,r0,p3,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o49,r0,p3,i9,'./temp/file2.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o32,r0,p2,i9,'./temp/file2.txt',tmp).
wt_file_write(o44,r0,p3,i16,'./outputs/file3.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i16,'./outputs/file3.txt',out).
wt_data_file(i15,'./inputs/file1.txt',in).
wt_data_file(i9,'./temp/file2.txt',tmp).
