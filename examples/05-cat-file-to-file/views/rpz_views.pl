

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_read(AccessID, ProcessID, FileIndex, FilePath).
%...................................................................................................
rpz_file_read(o31,p2,i11,'/lib/x86_64-linux-gnu/ld-2.24.so').
rpz_file_read(o32,p2,i13,'/etc/ld.so.cache').
rpz_file_read(o33,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6').
rpz_file_read(o34,p2,i15,'/usr/lib/locale/locale-archive').
rpz_file_read(o35,p2,i18,'./inputs/input.txt').


%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_write(AccessID, ProcessID, FileIndex, FilePath).
%...................................................................................................
rpz_file_write(o30,p2,i10,'./outputs/output.txt').
