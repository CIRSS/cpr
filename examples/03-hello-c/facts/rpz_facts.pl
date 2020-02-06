
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed(ExecutionID, RunID, ProcessID, FilePath, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed(e1, r0, p1, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/03-hello-c/./run.sh', './run.sh ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/03-hello-c', nil).
rpz_executed(e2, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/03-hello-c/./bin/hello_c', './bin/hello_c ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/03-hello-c', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened(FileID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened(o18, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/03-hello-c', 4, true, nil).
rpz_opened(o19, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/03-hello-c/bin/hello_c', 1, false, nil).
rpz_opened(o20, r0, p2, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o21, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o22, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
