

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ExecID, ExecPath).
%...................................................................................................
wt_process(p7,e7,'/bin/cat').
wt_process(p6,e6,'/bin/cat').
wt_process(p5,e5,'/bin/cat').
wt_process(p4,e4,'/bin/cat').
wt_process(p3,e3,'/bin/cat').
wt_process(p2,e2,'/bin/cat').
wt_process(p1,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o35,r0,p2,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o36,r0,p2,i14,'/etc/ld.so.cache',os).
wt_file_read(o37,r0,p2,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o38,r0,p2,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o39,r0,p2,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o40,r0,p2,i23,'./inputs/i1.txt',in).
wt_file_read(o41,r0,p2,i24,'./inputs/i2.txt',in).
wt_file_read(o49,r0,p3,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o50,r0,p3,i14,'/etc/ld.so.cache',os).
wt_file_read(o51,r0,p3,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o52,r0,p3,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o53,r0,p3,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o54,r0,p3,i23,'./inputs/i1.txt',in).
wt_file_read(o55,r0,p3,i24,'./inputs/i2.txt',in).
wt_file_read(o56,r0,p3,i26,'./inputs/i3.txt',in).
wt_file_read(o59,r0,p4,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o60,r0,p4,i14,'/etc/ld.so.cache',os).
wt_file_read(o61,r0,p4,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o62,r0,p4,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o63,r0,p4,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o64,r0,p4,i28,'./inputs/i4.txt',in).
wt_file_read(o67,r0,p5,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o68,r0,p5,i14,'/etc/ld.so.cache',os).
wt_file_read(o69,r0,p5,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o70,r0,p5,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o71,r0,p5,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o72,r0,p5,i11,'./temp/t12.txt',tmp).
wt_file_read(o75,r0,p6,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o76,r0,p6,i14,'/etc/ld.so.cache',os).
wt_file_read(o77,r0,p6,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o78,r0,p6,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o79,r0,p6,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o80,r0,p6,i25,'./temp/t123.txt',tmp).
wt_file_read(o81,r0,p6,i27,'./temp/t4.txt',tmp).
wt_file_read(o84,r0,p7,i12,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o85,r0,p7,i14,'/etc/ld.so.cache',os).
wt_file_read(o86,r0,p7,i15,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o87,r0,p7,i16,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o88,r0,p7,i20,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o89,r0,p7,i27,'./temp/t4.txt',tmp).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_write(o34,r0,p2,i11,'./temp/t12.txt',tmp).
wt_file_write(o48,r0,p3,i25,'./temp/t123.txt',tmp).
wt_file_write(o58,r0,p4,i27,'./temp/t4.txt',tmp).
wt_file_write(o66,r0,p5,i29,'./outputs/o12.txt',out).
wt_file_write(o74,r0,p6,i30,'./outputs/o1234.txt',out).
wt_file_write(o83,r0,p7,i31,'./outputs/o4.txt',out).


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
wt_data_file(i27,'./temp/t4.txt',tmp).
wt_data_file(i25,'./temp/t123.txt',tmp).
wt_data_file(i29,'./outputs/o12.txt',out).
wt_data_file(i31,'./outputs/o4.txt',out).
wt_data_file(i28,'./inputs/i4.txt',in).
wt_data_file(i11,'./temp/t12.txt',tmp).
wt_data_file(i23,'./inputs/i1.txt',in).
wt_data_file(i26,'./inputs/i3.txt',in).
wt_data_file(i30,'./outputs/o1234.txt',out).
wt_data_file(i24,'./inputs/i2.txt',in).
