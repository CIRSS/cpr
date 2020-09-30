

%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
cpr_process(p3,p1,e3,'/usr/bin/cat').
cpr_process(p2,p1,e2,'/usr/bin/cat').
cpr_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
cpr_file_read(o33,r0,p2,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o35,r0,p2,i13,'/etc/ld.so.cache',os).
cpr_file_read(o36,r0,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o37,r0,p2,i15,'./inputs/file1.txt',in).
cpr_file_read(o45,r0,p3,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o47,r0,p3,i13,'/etc/ld.so.cache',os).
cpr_file_read(o48,r0,p3,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o49,r0,p3,i9,'./temp/file2.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
cpr_file_write(o32,r0,p2,i9,'./temp/file2.txt',tmp).
cpr_file_write(o44,r0,p3,i16,'./outputs/file3.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: cpr_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
cpr_data_file(i16,'./outputs/file3.txt',out).
cpr_data_file(i15,'./inputs/file1.txt',in).
cpr_data_file(i9,'./temp/file2.txt',tmp).
