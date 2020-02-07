

%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o31,r0,p2,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o32,r0,p2,i13,'/etc/ld.so.cache',os).
wt_file_read(o33,r0,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o34,r0,p2,i15,'/usr/lib/locale/locale-archive',os).
wt_file_read(o35,r0,p2,i18,'/etc/localtime',os).
wt_file_read(o49,r0,p4,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o50,r0,p4,i13,'/etc/ld.so.cache',os).
wt_file_read(o51,r0,p4,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o52,r0,p4,i15,'/usr/lib/locale/locale-archive',os).
wt_file_read(o53,r0,p4,i10,'./outputs/date.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o30,r0,p2,i10,'./outputs/date.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, Path, PathRole).
%...................................................................................................
wt_data_file(i10,'./outputs/date.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ExecutionID, Path).
%...................................................................................................
wt_process(p4,e3,'/bin/cat').
wt_process(p2,e2,'/bin/date').
wt_process(p1,e1,'./run.sh').
