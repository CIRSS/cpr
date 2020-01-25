
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, 68038543004598).
rpz_process(p2, p1, r0, false, 0, 68038566448198).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/bin/sh", "/bin/sh ./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file", 68038548926098).
rpz_executed_file(e2, r0, p2, "/bin/cat", "cat input.txt ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file", 68038568078898).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file", 4, true, 68038543033998).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file", 4, true, 68038543037898).
rpz_opened_file(f3, r0, p1, "/bin/dash", 1, false, 68038549580598).
rpz_opened_file(f4, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 68038549624598).
rpz_opened_file(f5, r0, p1, "/etc/ld.so.cache", 1, false, 68038551307898).
rpz_opened_file(f6, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 68038552048398).
rpz_opened_file(f7, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/05-cat-file-to-file", 8, true, 68038556020198).
rpz_opened_file(f8, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/.", 8, true, 68038556690098).
rpz_opened_file(f9, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/./run.sh", 1, false, 68038558351198).
rpz_opened_file(f10, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/output.txt", 2, false, 68038562052198).
rpz_opened_file(f11, r0, p1, "/bin/cat", 8, false, 68038565464998).
rpz_opened_file(f12, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file", 4, true, 68038566457598).
rpz_opened_file(f13, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 68038568316298).
rpz_opened_file(f14, r0, p2, "/etc/ld.so.cache", 1, false, 68038569974698).
rpz_opened_file(f15, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 68038571419098).
rpz_opened_file(f16, r0, p2, "/usr/lib/locale/locale-archive", 1, false, 68038573639798).
rpz_opened_file(f17, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/05-cat-file-to-file/input.txt", 1, false, 68038576428798).
