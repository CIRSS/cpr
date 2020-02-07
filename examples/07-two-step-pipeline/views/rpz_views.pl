

%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o30,r0,p2,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o31,r0,p2,i13,'/etc/ld.so.cache',os).
wt_file_read(o32,r0,p2,i14,'/lib/x86_64-linux-gnu/libselinux.so.1',os).
wt_file_read(o33,r0,p2,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o34,r0,p2,i16,'/lib/x86_64-linux-gnu/libpcre.so.3',os).
wt_file_read(o35,r0,p2,i17,'/lib/x86_64-linux-gnu/libdl.so.2',os).
wt_file_read(o36,r0,p2,i18,'/lib/x86_64-linux-gnu/libpthread.so.0',os).
wt_file_read(o37,r0,p2,i19,'/proc/filesystems',nil).
wt_file_read(o38,r0,p2,i21,'/usr/lib/locale/locale-archive',os).
wt_file_read(o53,r0,p3,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o54,r0,p3,i13,'/etc/ld.so.cache',os).
wt_file_read(o55,r0,p3,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o56,r0,p3,i21,'/usr/lib/locale/locale-archive',os).
wt_file_read(o57,r0,p3,i26,'./inputs/file1.txt',in).
wt_file_read(o60,r0,p4,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o61,r0,p4,i13,'/etc/ld.so.cache',os).
wt_file_read(o62,r0,p4,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o63,r0,p4,i21,'/usr/lib/locale/locale-archive',os).
wt_file_read(o64,r0,p4,i25,'./temp/file2.txt',sw).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o52,r0,p3,i25,'./temp/file2.txt',sw).
wt_file_write(o59,r0,p4,i27,'./outputs/file3.txt',out).
