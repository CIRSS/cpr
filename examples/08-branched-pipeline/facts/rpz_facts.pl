
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).
rpz_process(p3, p1, r0, false, 0, nil).
rpz_process(p4, p1, r0, false, 0, nil).
rpz_process(p5, p1, r0, false, 0, nil).
rpz_process(p6, p1, r0, false, 0, nil).
rpz_process(p7, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/examples/08-branched-pipeline/./run.sh', '/mnt/examples/08-branched-pipeline', nil).
rpz_execution(e2, r0, p2, '/bin/cat', '/mnt/examples/08-branched-pipeline', nil).
rpz_execution(e3, r0, p3, '/bin/cat', '/mnt/examples/08-branched-pipeline', nil).
rpz_execution(e4, r0, p4, '/bin/cat', '/mnt/examples/08-branched-pipeline', nil).
rpz_execution(e5, r0, p5, '/bin/cat', '/mnt/examples/08-branched-pipeline', nil).
rpz_execution(e6, r0, p6, '/bin/cat', '/mnt/examples/08-branched-pipeline', nil).
rpz_execution(e7, r0, p7, '/bin/cat', '/mnt/examples/08-branched-pipeline', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, 'cat').
rpz_argument(e2, 1, 'inputs/i1.txt').
rpz_argument(e2, 2, 'inputs/i2.txt').
rpz_argument(e3, 0, 'cat').
rpz_argument(e3, 1, 'inputs/i1.txt').
rpz_argument(e3, 2, 'inputs/i2.txt').
rpz_argument(e3, 3, 'inputs/i3.txt').
rpz_argument(e4, 0, 'cat').
rpz_argument(e4, 1, 'inputs/i4.txt').
rpz_argument(e5, 0, 'cat').
rpz_argument(e5, 1, 'temp/t12.txt').
rpz_argument(e6, 0, 'cat').
rpz_argument(e6, 1, 'temp/t123.txt').
rpz_argument(e6, 2, 'temp/t4.txt').
rpz_argument(e7, 0, 'cat').
rpz_argument(e7, 1, 'temp/t4.txt').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o33, r0, p2, '/mnt/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o34, r0, p2, '/mnt/examples/08-branched-pipeline/temp/t12.txt', 2, false, nil).
rpz_file_open(o35, r0, p2, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o36, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o37, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o38, r0, p2, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o39, r0, p2, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o40, r0, p2, '/mnt/examples/08-branched-pipeline/inputs/i1.txt', 1, false, nil).
rpz_file_open(o41, r0, p2, '/mnt/examples/08-branched-pipeline/inputs/i2.txt', 1, false, nil).
rpz_file_open(o47, r0, p3, '/mnt/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o48, r0, p3, '/mnt/examples/08-branched-pipeline/temp/t123.txt', 2, false, nil).
rpz_file_open(o49, r0, p3, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o50, r0, p3, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o51, r0, p3, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o52, r0, p3, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o53, r0, p3, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o54, r0, p3, '/mnt/examples/08-branched-pipeline/inputs/i1.txt', 1, false, nil).
rpz_file_open(o55, r0, p3, '/mnt/examples/08-branched-pipeline/inputs/i2.txt', 1, false, nil).
rpz_file_open(o56, r0, p3, '/mnt/examples/08-branched-pipeline/inputs/i3.txt', 1, false, nil).
rpz_file_open(o57, r0, p4, '/mnt/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o58, r0, p4, '/mnt/examples/08-branched-pipeline/temp/t4.txt', 2, false, nil).
rpz_file_open(o59, r0, p4, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o60, r0, p4, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o61, r0, p4, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o62, r0, p4, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o63, r0, p4, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o64, r0, p4, '/mnt/examples/08-branched-pipeline/inputs/i4.txt', 1, false, nil).
rpz_file_open(o65, r0, p5, '/mnt/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o66, r0, p5, '/mnt/examples/08-branched-pipeline/outputs/o12.txt', 2, false, nil).
rpz_file_open(o67, r0, p5, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o68, r0, p5, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o69, r0, p5, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o70, r0, p5, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o71, r0, p5, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o72, r0, p5, '/mnt/examples/08-branched-pipeline/temp/t12.txt', 1, false, nil).
rpz_file_open(o73, r0, p6, '/mnt/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o74, r0, p6, '/mnt/examples/08-branched-pipeline/outputs/o1234.txt', 2, false, nil).
rpz_file_open(o75, r0, p6, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o76, r0, p6, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o77, r0, p6, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o78, r0, p6, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o79, r0, p6, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o80, r0, p6, '/mnt/examples/08-branched-pipeline/temp/t123.txt', 1, false, nil).
rpz_file_open(o81, r0, p6, '/mnt/examples/08-branched-pipeline/temp/t4.txt', 1, false, nil).
rpz_file_open(o82, r0, p7, '/mnt/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o83, r0, p7, '/mnt/examples/08-branched-pipeline/outputs/o4.txt', 2, false, nil).
rpz_file_open(o84, r0, p7, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o85, r0, p7, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o86, r0, p7, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o87, r0, p7, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o88, r0, p7, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o89, r0, p7, '/mnt/examples/08-branched-pipeline/temp/t4.txt', 1, false, nil).
