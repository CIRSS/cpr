

%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o31,r0,p2,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o32,r0,p2,i14,'/etc/ld.so.cache',os).
wt_file_read(o33,r0,p2,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o34,r0,p2,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o35,r0,p2,i19,'./inputs/i1.txt',in).
wt_file_read(o36,r0,p2,i20,'./inputs/i2.txt',in).
wt_file_read(o39,r0,p3,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o40,r0,p3,i14,'/etc/ld.so.cache',os).
wt_file_read(o41,r0,p3,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o42,r0,p3,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o43,r0,p3,i19,'./inputs/i1.txt',in).
wt_file_read(o44,r0,p3,i20,'./inputs/i2.txt',in).
wt_file_read(o45,r0,p3,i22,'./inputs/i3.txt',in).
wt_file_read(o48,r0,p4,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o49,r0,p4,i14,'/etc/ld.so.cache',os).
wt_file_read(o50,r0,p4,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o51,r0,p4,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o52,r0,p4,i24,'./inputs/i4.txt',in).
wt_file_read(o55,r0,p5,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o56,r0,p5,i14,'/etc/ld.so.cache',os).
wt_file_read(o57,r0,p5,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o58,r0,p5,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o59,r0,p5,i11,'./temp/t12.txt',tmp).
wt_file_read(o62,r0,p6,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o63,r0,p6,i14,'/etc/ld.so.cache',os).
wt_file_read(o64,r0,p6,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o65,r0,p6,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o66,r0,p6,i21,'./temp/t123.txt',tmp).
wt_file_read(o67,r0,p6,i23,'./temp/t4.txt',tmp).
wt_file_read(o70,r0,p7,i12,'/lib/x86_64-linux-gnu/ld-2.24.so',os).
wt_file_read(o71,r0,p7,i14,'/etc/ld.so.cache',os).
wt_file_read(o72,r0,p7,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o73,r0,p7,i16,'/usr/lib/locale/locale-archive',os).
wt_file_read(o74,r0,p7,i23,'./temp/t4.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o30,r0,p2,i11,'./temp/t12.txt',tmp).
wt_file_write(o38,r0,p3,i21,'./temp/t123.txt',tmp).
wt_file_write(o47,r0,p4,i23,'./temp/t4.txt',tmp).
wt_file_write(o54,r0,p5,i25,'./outputs/o12.txt',out).
wt_file_write(o61,r0,p6,i26,'./outputs/o1234.txt',out).
wt_file_write(o69,r0,p7,i27,'./outputs/o4.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, Path, PathRole).
%...................................................................................................
wt_data_file(i25,'./outputs/o12.txt',out).
wt_data_file(i22,'./inputs/i3.txt',in).
wt_data_file(i27,'./outputs/o4.txt',out).
wt_data_file(i23,'./temp/t4.txt',tmp).
wt_data_file(i20,'./inputs/i2.txt',in).
wt_data_file(i21,'./temp/t123.txt',tmp).
wt_data_file(i26,'./outputs/o1234.txt',out).
wt_data_file(i24,'./inputs/i4.txt',in).
wt_data_file(i11,'./temp/t12.txt',tmp).
wt_data_file(i19,'./inputs/i1.txt',in).


%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ExecutionID, Path).
%...................................................................................................
wt_process(p7,e7,'/bin/cat').
wt_process(p6,e6,'/bin/cat').
wt_process(p5,e5,'/bin/cat').
wt_process(p4,e4,'/bin/cat').
wt_process(p3,e3,'/bin/cat').
wt_process(p2,e2,'/bin/cat').
wt_process(p1,e1,'./run.sh').
