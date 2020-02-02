
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).
rpz_process(p3, p2, r0, true, 0, nil).
rpz_process(p4, p2, r0, true, 0, nil).
rpz_process(p5, p2, r0, true, 0, nil).
rpz_process(p6, p4, r0, true, 0, nil).
rpz_process(p7, p6, r0, true, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, FileIndex, FilePath, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, i1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go/./run.sh", "./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", nil).
rpz_executed_file(e2, r0, p2, i2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go/./bin/hello_go", "./bin/hello_go ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, FileIndex, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f18, r0, p2, i3, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", 4, true, nil).
rpz_opened_file(f19, r0, p2, i2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go/bin/hello_go", 1, false, nil).
rpz_opened_file(f20, r0, p2, i4, "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size", 1, false, nil).
rpz_opened_file(f21, r0, p3, i3, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", 4, true, nil).
rpz_opened_file(f22, r0, p4, i3, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", 4, true, nil).
rpz_opened_file(f23, r0, p5, i3, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", 4, true, nil).
rpz_opened_file(f24, r0, p6, i3, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", 4, true, nil).
rpz_opened_file(f25, r0, p7, i3, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/02-hello-go", 4, true, nil).
rpz_opened_file(f26, r0, p2, i5, "/proc/self/exe", 24, false, nil).
