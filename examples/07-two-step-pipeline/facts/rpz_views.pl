

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ExecID, ExecPath).
%...................................................................................................
wt_process(p3,e3,'/bin/cat').
wt_process(p2,e2,'/bin/cat').
wt_process(p1,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o31,r0,p2,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o32,r0,p2,i14,'/etc/ld.so.cache',os).
wt_file_read(o33,r0,p2,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o34,r0,p2,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o35,r0,p2,i19,'./inputs/file1.txt',in).
wt_file_read(o38,r0,p3,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o39,r0,p3,i14,'/etc/ld.so.cache',os).
wt_file_read(o40,r0,p3,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o41,r0,p3,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o42,r0,p3,i11,'./temp/file2.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o30,r0,p2,i11,'./temp/file2.txt',tmp).
wt_file_write(o37,r0,p3,i20,'./outputs/file3.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i20,'./outputs/file3.txt',out).
wt_data_file(i19,'./inputs/file1.txt',in).
wt_data_file(i11,'./temp/file2.txt',tmp).
