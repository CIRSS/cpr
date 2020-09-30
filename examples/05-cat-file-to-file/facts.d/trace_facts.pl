
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/cpr/examples/05-cat-file-to-file/./run.sh', '/mnt/cpr/examples/05-cat-file-to-file', nil).
rpz_execution(e2, r0, p2, '/usr/bin/cat', '/mnt/cpr/examples/05-cat-file-to-file', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, 'cat').
rpz_argument(e2, 1, 'inputs/input.txt').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o31, r0, p2, '/mnt/cpr/examples/05-cat-file-to-file', 4, true, nil).
rpz_file_open(o32, r0, p2, '/mnt/cpr/examples/05-cat-file-to-file/outputs/output.txt', 2, false, nil).
rpz_file_open(o33, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o35, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o36, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o37, r0, p2, '/mnt/cpr/examples/05-cat-file-to-file/inputs/input.txt', 1, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '05-cat-file-to-file').

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
wt_path_role(r0, '/tmp', i7, nul).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i15, sw).
wt_accessed_path(e2, r0, '/usr/bin/cat', i16, sw).
wt_accessed_path(o31, r0, '.', i3, sw).
wt_accessed_path(o32, r0, './outputs/output.txt', i8, out).
wt_accessed_path(o33, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i9, os).
wt_accessed_path(o35, r0, '/etc/ld.so.cache', i12, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libc.so.6', i13, os).
wt_accessed_path(o37, r0, './inputs/input.txt', i14, in).
