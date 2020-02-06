

%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o19,p2,i5,'./bin/hello_c',sw).
wt_file_read(o20,p2,i7,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o21,p2,i9,'/etc/ld.so.cache',os).
wt_file_read(o22,p2,i10,'/lib/x86_64-linux-gnu/libc.so.6',os).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
