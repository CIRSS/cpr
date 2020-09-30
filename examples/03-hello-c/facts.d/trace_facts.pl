
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/cpr/examples/03-hello-c/./run.sh', '/mnt/cpr/examples/03-hello-c', nil).
rpz_execution(e2, r0, p2, '/mnt/cpr/examples/03-hello-c/./bin/hello_c', '/mnt/cpr/examples/03-hello-c', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, './bin/hello_c').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o20, r0, p2, '/mnt/cpr/examples/03-hello-c', 4, true, nil).
rpz_file_open(o21, r0, p2, '/mnt/cpr/examples/03-hello-c/bin/hello_c', 1, false, nil).
rpz_file_open(o22, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
rpz_file_open(o24, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o25, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '03-hello-c').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '.', i3, sw).
wt_path_role(r0, '/tmp', i4, nul).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i12, sw).
wt_accessed_path(e2, r0, './bin/hello_c', i5, sw).
wt_accessed_path(o20, r0, '.', i3, sw).
wt_accessed_path(o21, r0, './bin/hello_c', i5, sw).
wt_accessed_path(o22, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i7, os).
wt_accessed_path(o24, r0, '/etc/ld.so.cache', i10, os).
wt_accessed_path(o25, r0, '/lib/x86_64-linux-gnu/libc.so.6', i11, os).
