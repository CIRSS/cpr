

%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o31,p2,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o32,p2,i13,'/etc/ld.so.cache',os).
wt_file_read(o33,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o34,p2,i15,'/usr/lib/locale/locale-archive',os).
wt_file_read(o35,p2,i18,'/etc/localtime',os).
wt_file_read(o49,p4,i11,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o50,p4,i13,'/etc/ld.so.cache',os).
wt_file_read(o51,p4,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o52,p4,i15,'/usr/lib/locale/locale-archive',os).
wt_file_read(o53,p4,i10,'./outputs/date.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o30,p2,i10,'./outputs/date.txt',out).
