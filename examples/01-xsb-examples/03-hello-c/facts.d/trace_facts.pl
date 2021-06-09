
%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_process(p1, nil, r0, false, 0, nil).
cpr_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_execution(e1, r0, p1, '/mnt/cpr/examples/01-xsb-examples/03-hello-c/./run.sh', '/mnt/cpr/examples/01-xsb-examples/03-hello-c', nil).
cpr_execution(e2, r0, p2, '/mnt/cpr/examples/01-xsb-examples/03-hello-c/./bin/hello_c', '/mnt/cpr/examples/01-xsb-examples/03-hello-c', nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
cpr_argument(e1, 0, './run.sh').
cpr_argument(e2, 0, './bin/hello_c').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
cpr_file_open(o20, r0, p2, '/mnt/cpr/examples/01-xsb-examples/03-hello-c', 4, true, nil).
cpr_file_open(o21, r0, p2, '/mnt/cpr/examples/01-xsb-examples/03-hello-c/bin/hello_c', 1, false, nil).
cpr_file_open(o22, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
cpr_file_open(o24, r0, p2, '/etc/ld.so.cache', 1, false, nil).
cpr_file_open(o25, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
cpr_run(r0, '03-hello-c').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
cpr_path_role(r0, '/lib', i1, os).
cpr_path_role(r0, '/etc', i2, os).
cpr_path_role(r0, '.', i3, sw).
cpr_path_role(r0, '/tmp', i4, nul).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
cpr_accessed_path(e1, r0, './run.sh', i12, sw).
cpr_accessed_path(e2, r0, './bin/hello_c', i5, sw).
cpr_accessed_path(o20, r0, '.', i3, sw).
cpr_accessed_path(o21, r0, './bin/hello_c', i5, sw).
cpr_accessed_path(o22, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i7, os).
cpr_accessed_path(o24, r0, '/etc/ld.so.cache', i10, os).
cpr_accessed_path(o25, r0, '/lib/x86_64-linux-gnu/libc.so.6', i11, os).
