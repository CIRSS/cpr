

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p3,p1,e3,'/bin/cat').
wt_process(p2,p1,e2,'/bin/cat').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o35,r0,p2,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o36,r0,p2,i14,'/etc/ld.so.cache',os).
wt_file_read(o37,r0,p2,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o38,r0,p2,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o39,r0,p2,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o40,r0,p2,i23,'./inputs/file1.txt',in).
wt_file_read(o48,r0,p3,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o49,r0,p3,i14,'/etc/ld.so.cache',os).
wt_file_read(o50,r0,p3,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o51,r0,p3,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o52,r0,p3,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o53,r0,p3,i11,'./temp/file2.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o34,r0,p2,i11,'./temp/file2.txt',tmp).
wt_file_write(o47,r0,p3,i24,'./outputs/file3.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i24,'./outputs/file3.txt',out).
wt_data_file(i23,'./inputs/file1.txt',in).
wt_data_file(i11,'./temp/file2.txt',tmp).
