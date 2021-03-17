

%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
cpr_process(p7,p1,e7,'/usr/bin/cat').
cpr_process(p6,p1,e6,'/usr/bin/cat').
cpr_process(p5,p1,e5,'/usr/bin/cat').
cpr_process(p4,p1,e4,'/usr/bin/cat').
cpr_process(p3,p1,e3,'/usr/bin/cat').
cpr_process(p2,p1,e2,'/usr/bin/cat').
cpr_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
cpr_file_read(o33,r0,p2,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o35,r0,p2,i13,'/etc/ld.so.cache',os).
cpr_file_read(o36,r0,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o37,r0,p2,i15,'./inputs/i1.txt',in).
cpr_file_read(o38,r0,p2,i16,'./inputs/i2.txt',in).
cpr_file_read(o46,r0,p3,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o48,r0,p3,i13,'/etc/ld.so.cache',os).
cpr_file_read(o49,r0,p3,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o50,r0,p3,i15,'./inputs/i1.txt',in).
cpr_file_read(o51,r0,p3,i16,'./inputs/i2.txt',in).
cpr_file_read(o52,r0,p3,i18,'./inputs/i3.txt',in).
cpr_file_read(o55,r0,p4,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o57,r0,p4,i13,'/etc/ld.so.cache',os).
cpr_file_read(o58,r0,p4,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o59,r0,p4,i20,'./inputs/i4.txt',in).
cpr_file_read(o62,r0,p5,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o64,r0,p5,i13,'/etc/ld.so.cache',os).
cpr_file_read(o65,r0,p5,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o66,r0,p5,i9,'./temp/t12.txt',tmp).
cpr_file_read(o69,r0,p6,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o71,r0,p6,i13,'/etc/ld.so.cache',os).
cpr_file_read(o72,r0,p6,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o73,r0,p6,i17,'./temp/t123.txt',tmp).
cpr_file_read(o74,r0,p6,i19,'./temp/t4.txt',tmp).
cpr_file_read(o77,r0,p7,i10,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o79,r0,p7,i13,'/etc/ld.so.cache',os).
cpr_file_read(o80,r0,p7,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o81,r0,p7,i19,'./temp/t4.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
cpr_file_write(o32,r0,p2,i9,'./temp/t12.txt',tmp).
cpr_file_write(o45,r0,p3,i17,'./temp/t123.txt',tmp).
cpr_file_write(o54,r0,p4,i19,'./temp/t4.txt',tmp).
cpr_file_write(o61,r0,p5,i21,'./outputs/o12.txt',out).
cpr_file_write(o68,r0,p6,i22,'./outputs/o1234.txt',out).
cpr_file_write(o76,r0,p7,i23,'./outputs/o4.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: cpr_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
cpr_data_file(i19,'./temp/t4.txt',tmp).
cpr_data_file(i20,'./inputs/i4.txt',in).
cpr_data_file(i9,'./temp/t12.txt',tmp).
cpr_data_file(i21,'./outputs/o12.txt',out).
cpr_data_file(i22,'./outputs/o1234.txt',out).
cpr_data_file(i15,'./inputs/i1.txt',in).
cpr_data_file(i23,'./outputs/o4.txt',out).
cpr_data_file(i16,'./inputs/i2.txt',in).
cpr_data_file(i17,'./temp/t123.txt',tmp).
cpr_data_file(i18,'./inputs/i3.txt',in).
