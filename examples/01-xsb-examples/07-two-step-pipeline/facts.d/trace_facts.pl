
%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_process(p1, nil, r0, false, 0, nil).
cpr_process(p2, p1, r0, false, 0, nil).
cpr_process(p3, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_execution(e1, r0, p1, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline/./run.sh', '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline', nil).
cpr_execution(e2, r0, p2, '/usr/bin/cat', '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline', nil).
cpr_execution(e3, r0, p3, '/usr/bin/cat', '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline', nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
cpr_argument(e1, 0, './run.sh').
cpr_argument(e2, 0, 'cat').
cpr_argument(e2, 1, 'inputs/file1.txt').
cpr_argument(e3, 0, 'cat').
cpr_argument(e3, 1, 'temp/file2.txt').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
cpr_file_open(o31, r0, p2, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline', 4, true, nil).
cpr_file_open(o32, r0, p2, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline/temp/file2.txt', 2, false, nil).
cpr_file_open(o33, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
cpr_file_open(o35, r0, p2, '/etc/ld.so.cache', 1, false, nil).
cpr_file_open(o36, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
cpr_file_open(o37, r0, p2, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline/inputs/file1.txt', 1, false, nil).
cpr_file_open(o43, r0, p3, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline', 4, true, nil).
cpr_file_open(o44, r0, p3, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline/outputs/file3.txt', 2, false, nil).
cpr_file_open(o45, r0, p3, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
cpr_file_open(o47, r0, p3, '/etc/ld.so.cache', 1, false, nil).
cpr_file_open(o48, r0, p3, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
cpr_file_open(o49, r0, p3, '/mnt/cpr/examples/01-xsb-examples/07-two-step-pipeline/temp/file2.txt', 1, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
cpr_run(r0, '07-two-step-pipeline').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
cpr_path_role(r0, '/lib', i1, os).
cpr_path_role(r0, '/etc', i2, os).
cpr_path_role(r0, '/usr/lib', i1, os).
cpr_path_role(r0, '.', i3, sw).
cpr_path_role(r0, '/bin', i4, sw).
cpr_path_role(r0, './inputs', i5, in).
cpr_path_role(r0, './outputs', i6, out).
cpr_path_role(r0, './temp', i7, tmp).
cpr_path_role(r0, '/tmp', i8, nul).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
cpr_accessed_path(e1, r0, './run.sh', i17, sw).
cpr_accessed_path(e2, r0, '/usr/bin/cat', i18, sw).
cpr_accessed_path(e3, r0, '/usr/bin/cat', i18, sw).
cpr_accessed_path(o31, r0, '.', i3, sw).
cpr_accessed_path(o32, r0, './temp/file2.txt', i9, tmp).
cpr_accessed_path(o33, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
cpr_accessed_path(o35, r0, '/etc/ld.so.cache', i13, os).
cpr_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
cpr_accessed_path(o37, r0, './inputs/file1.txt', i15, in).
cpr_accessed_path(o43, r0, '.', i3, sw).
cpr_accessed_path(o44, r0, './outputs/file3.txt', i16, out).
cpr_accessed_path(o45, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i10, os).
cpr_accessed_path(o47, r0, '/etc/ld.so.cache', i13, os).
cpr_accessed_path(o48, r0, '/lib/x86_64-linux-gnu/libc.so.6', i14, os).
cpr_accessed_path(o49, r0, './temp/file2.txt', i9, tmp).
