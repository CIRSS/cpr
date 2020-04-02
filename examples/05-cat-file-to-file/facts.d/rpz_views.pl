

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ExecID, ExecPath).
%...................................................................................................
wt_process(p2,e2,'/bin/cat').
wt_process(p1,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o35,r0,p2,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o36,r0,p2,i13,'/etc/ld.so.cache',os).
wt_file_read(o37,r0,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o38,r0,p2,i15,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o39,r0,p2,i19,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o40,r0,p2,i22,'./inputs/input.txt',in).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o34,r0,p2,i10,'./outputs/output.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i22,'./inputs/input.txt',in).
wt_data_file(i10,'./outputs/output.txt',out).
