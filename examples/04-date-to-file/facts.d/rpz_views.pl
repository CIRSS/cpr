

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p4,p1,e3,'/bin/cat').
wt_process(p2,p1,e2,'/bin/date').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o33,r0,p2,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o35,r0,p2,i14,'/etc/ld.so.cache',os).
wt_file_read(o36,r0,p2,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o37,r0,p2,i16,'/etc/localtime',os).
wt_file_read(o56,r0,p4,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o58,r0,p4,i14,'/etc/ld.so.cache',os).
wt_file_read(o59,r0,p4,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o60,r0,p4,i10,'./outputs/date.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o32,r0,p2,i10,'./outputs/date.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i10,'./outputs/date.txt',out).
