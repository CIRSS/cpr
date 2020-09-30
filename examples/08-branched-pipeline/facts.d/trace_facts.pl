
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
rpz_execution(e1, r0, p1, '/mnt/cpr/examples/08-branched-pipeline/./run.sh', '/mnt/cpr/examples/08-branched-pipeline', nil).
rpz_execution(e2, r0, p2, '/usr/bin/cat', '/mnt/cpr/examples/08-branched-pipeline', nil).
rpz_execution(e3, r0, p3, '/usr/bin/cat', '/mnt/cpr/examples/08-branched-pipeline', nil).
rpz_execution(e4, r0, p4, '/usr/bin/cat', '/mnt/cpr/examples/08-branched-pipeline', nil).
rpz_execution(e5, r0, p5, '/usr/bin/cat', '/mnt/cpr/examples/08-branched-pipeline', nil).
rpz_execution(e6, r0, p6, '/usr/bin/cat', '/mnt/cpr/examples/08-branched-pipeline', nil).
rpz_execution(e7, r0, p7, '/usr/bin/cat', '/mnt/cpr/examples/08-branched-pipeline', nil).

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
rpz_file_open(o31, r0, p2, '/mnt/cpr/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o32, r0, p2, '/mnt/cpr/examples/08-branched-pipeline/temp/t12.txt', 2, false, nil).
rpz_file_open(o33, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o35, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o36, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o37, r0, p2, '/mnt/cpr/examples/08-branched-pipeline/inputs/i1.txt', 1, false, nil).
rpz_file_open(o38, r0, p2, '/mnt/cpr/examples/08-branched-pipeline/inputs/i2.txt', 1, false, nil).
rpz_file_open(o44, r0, p3, '/mnt/cpr/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o45, r0, p3, '/mnt/cpr/examples/08-branched-pipeline/temp/t123.txt', 2, false, nil).
rpz_file_open(o46, r0, p3, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o48, r0, p3, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o49, r0, p3, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o50, r0, p3, '/mnt/cpr/examples/08-branched-pipeline/inputs/i1.txt', 1, false, nil).
rpz_file_open(o51, r0, p3, '/mnt/cpr/examples/08-branched-pipeline/inputs/i2.txt', 1, false, nil).
rpz_file_open(o52, r0, p3, '/mnt/cpr/examples/08-branched-pipeline/inputs/i3.txt', 1, false, nil).
rpz_file_open(o53, r0, p4, '/mnt/cpr/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o54, r0, p4, '/mnt/cpr/examples/08-branched-pipeline/temp/t4.txt', 2, false, nil).
rpz_file_open(o55, r0, p4, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o57, r0, p4, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o58, r0, p4, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o59, r0, p4, '/mnt/cpr/examples/08-branched-pipeline/inputs/i4.txt', 1, false, nil).
rpz_file_open(o60, r0, p5, '/mnt/cpr/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o61, r0, p5, '/mnt/cpr/examples/08-branched-pipeline/outputs/o12.txt', 2, false, nil).
rpz_file_open(o62, r0, p5, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o64, r0, p5, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o65, r0, p5, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o66, r0, p5, '/mnt/cpr/examples/08-branched-pipeline/temp/t12.txt', 1, false, nil).
rpz_file_open(o67, r0, p6, '/mnt/cpr/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o68, r0, p6, '/mnt/cpr/examples/08-branched-pipeline/outputs/o1234.txt', 2, false, nil).
rpz_file_open(o69, r0, p6, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o71, r0, p6, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o72, r0, p6, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o73, r0, p6, '/mnt/cpr/examples/08-branched-pipeline/temp/t123.txt', 1, false, nil).
rpz_file_open(o74, r0, p6, '/mnt/cpr/examples/08-branched-pipeline/temp/t4.txt', 1, false, nil).
rpz_file_open(o75, r0, p7, '/mnt/cpr/examples/08-branched-pipeline', 4, true, nil).
rpz_file_open(o76, r0, p7, '/mnt/cpr/examples/08-branched-pipeline/outputs/o4.txt', 2, false, nil).
rpz_file_open(o77, r0, p7, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o79, r0, p7, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o80, r0, p7, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o81, r0, p7, '/mnt/cpr/examples/08-branched-pipeline/temp/t4.txt', 1, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '08-branched-pipeline').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '/usr/lib', i1, os).
wt_path_role(r0, '.', i3, sw).
wt_path_role(r0, '/bin', i4, sw).
wt_path_role(r0, './inputs', i5, in).
wt_path_role(r0, './outputs', i6, out).
wt_path_role(r0, './temp', i7, tmp).
wt_path_role(r0, '/tmp', i8, nul).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i24, sw).
wt_accessed_path(e2, r0, '/usr/bin/cat', i25, sw).
wt_accessed_path(e3, r0, '/usr/bin/cat', i25, sw).
wt_accessed_path(e4, r0, '/usr/bin/cat', i25, sw).
wt_accessed_path(e5, r0, '/usr/bin/cat', i25, sw).
wt_accessed_path(e6, r0, '/usr/bin/cat', i25, sw).
wt_accessed_path(e7, r0, '/usr/bin/cat', i25, sw).
wt_accessed_path(o31, r0, '.', i3, sw).
wt_accessed_path(o32, r0, './temp/t12.txt', i9, tmp).
wt_accessed_path(o33, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o37, r0, './inputs/i1.txt', i15, in).
wt_accessed_path(o38, r0, './inputs/i2.txt', i16, in).
wt_accessed_path(o44, r0, '.', i3, sw).
wt_accessed_path(o45, r0, './temp/t123.txt', i17, tmp).
wt_accessed_path(o46, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
wt_accessed_path(o48, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o49, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o50, r0, './inputs/i1.txt', i15, in).
wt_accessed_path(o51, r0, './inputs/i2.txt', i16, in).
wt_accessed_path(o52, r0, './inputs/i3.txt', i18, in).
wt_accessed_path(o53, r0, '.', i3, sw).
wt_accessed_path(o54, r0, './temp/t4.txt', i19, tmp).
wt_accessed_path(o55, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
wt_accessed_path(o57, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o58, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o59, r0, './inputs/i4.txt', i20, in).
wt_accessed_path(o60, r0, '.', i3, sw).
wt_accessed_path(o61, r0, './outputs/o12.txt', i21, out).
wt_accessed_path(o62, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
wt_accessed_path(o64, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o65, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o66, r0, './temp/t12.txt', i9, tmp).
wt_accessed_path(o67, r0, '.', i3, sw).
wt_accessed_path(o68, r0, './outputs/o1234.txt', i22, out).
wt_accessed_path(o69, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
wt_accessed_path(o71, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o72, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o73, r0, './temp/t123.txt', i17, tmp).
wt_accessed_path(o74, r0, './temp/t4.txt', i19, tmp).
wt_accessed_path(o75, r0, '.', i3, sw).
wt_accessed_path(o76, r0, './outputs/o4.txt', i23, out).
wt_accessed_path(o77, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
wt_accessed_path(o79, r0, '/etc/ld.so.cache', i13, os).
wt_accessed_path(o80, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
wt_accessed_path(o81, r0, './temp/t4.txt', i19, tmp).
