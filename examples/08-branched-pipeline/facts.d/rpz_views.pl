

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p7,p1,e7,'/bin/cat').
wt_process(p6,p1,e6,'/bin/cat').
wt_process(p5,p1,e5,'/bin/cat').
wt_process(p4,p1,e4,'/bin/cat').
wt_process(p3,p1,e3,'/bin/cat').
wt_process(p2,p1,e2,'/bin/cat').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o33,r0,p2,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o35,r0,p2,i13,'/etc/ld.so.cache',os).
wt_file_read(o36,r0,p2,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o37,r0,p2,i15,'./inputs/i1.txt',in).
wt_file_read(o38,r0,p2,i16,'./inputs/i2.txt',in).
wt_file_read(o46,r0,p3,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o48,r0,p3,i13,'/etc/ld.so.cache',os).
wt_file_read(o49,r0,p3,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o50,r0,p3,i15,'./inputs/i1.txt',in).
wt_file_read(o51,r0,p3,i16,'./inputs/i2.txt',in).
wt_file_read(o52,r0,p3,i18,'./inputs/i3.txt',in).
wt_file_read(o55,r0,p4,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o57,r0,p4,i13,'/etc/ld.so.cache',os).
wt_file_read(o58,r0,p4,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o59,r0,p4,i20,'./inputs/i4.txt',in).
wt_file_read(o62,r0,p5,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o64,r0,p5,i13,'/etc/ld.so.cache',os).
wt_file_read(o65,r0,p5,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o66,r0,p5,i10,'./temp/t12.txt',tmp).
wt_file_read(o69,r0,p6,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o71,r0,p6,i13,'/etc/ld.so.cache',os).
wt_file_read(o72,r0,p6,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o73,r0,p6,i17,'./temp/t123.txt',tmp).
wt_file_read(o74,r0,p6,i19,'./temp/t4.txt',tmp).
wt_file_read(o77,r0,p7,i11,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o79,r0,p7,i13,'/etc/ld.so.cache',os).
wt_file_read(o80,r0,p7,i14,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o81,r0,p7,i19,'./temp/t4.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o32,r0,p2,i10,'./temp/t12.txt',tmp).
wt_file_write(o45,r0,p3,i17,'./temp/t123.txt',tmp).
wt_file_write(o54,r0,p4,i19,'./temp/t4.txt',tmp).
wt_file_write(o61,r0,p5,i21,'./outputs/o12.txt',out).
wt_file_write(o68,r0,p6,i22,'./outputs/o1234.txt',out).
wt_file_write(o76,r0,p7,i23,'./outputs/o4.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i15,'./inputs/i1.txt',in).
wt_data_file(i23,'./outputs/o4.txt',out).
wt_data_file(i10,'./temp/t12.txt',tmp).
wt_data_file(i16,'./inputs/i2.txt',in).
wt_data_file(i19,'./temp/t4.txt',tmp).
wt_data_file(i17,'./temp/t123.txt',tmp).
wt_data_file(i22,'./outputs/o1234.txt',out).
wt_data_file(i20,'./inputs/i4.txt',in).
wt_data_file(i21,'./outputs/o12.txt',out).
wt_data_file(i18,'./inputs/i3.txt',in).
