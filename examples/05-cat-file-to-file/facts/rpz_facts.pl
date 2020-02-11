
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/./run.sh', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file', nil).
rpz_execution(e2, r0, p2, '/bin/cat', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, 'cat').
rpz_argument(e2, 1, 'inputs/input.txt').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o29, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file', 4, true, nil).
rpz_file_open(o30, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/outputs/output.txt', 2, false, nil).
rpz_file_open(o31, r0, p2, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_file_open(o32, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o33, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o34, r0, p2, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_file_open(o35, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/inputs/input.txt', 1, false, nil).
