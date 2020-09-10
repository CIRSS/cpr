

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p2,p1,e2,'/bin/date').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o32,r0,p2,i8,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o34,r0,p2,i15,'/etc/ld.so.cache',os).
wt_file_read(o35,r0,p2,i16,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o36,r0,p2,i17,'/etc/localtime',os).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
