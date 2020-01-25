
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, 23950563002998).
rpz_process(p2, p1, r0, false, 0, 23950590480198).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/bin/sh", "/bin/sh ./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 23950570302598).
rpz_executed_file(e2, r0, p2, "/bin/date", "date ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 23950592075898).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 4, true, 23950563010598).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 4, true, 23950563013498).
rpz_opened_file(f3, r0, p1, "/bin/dash", 1, false, 23950570617998).
rpz_opened_file(f4, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 23950570630798).
rpz_opened_file(f5, r0, p1, "/etc/ld.so.cache", 1, false, 23950572355698).
rpz_opened_file(f6, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 23950573933798).
rpz_opened_file(f7, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file", 8, true, 23950578404198).
rpz_opened_file(f8, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/.", 8, true, 23950579323598).
rpz_opened_file(f9, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/./run.sh", 1, false, 23950581234398).
rpz_opened_file(f10, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/date.txt", 2, false, 23950586545598).
rpz_opened_file(f11, r0, p1, "/bin/date", 8, false, 23950589856598).
rpz_opened_file(f12, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 4, true, 23950590491298).
rpz_opened_file(f13, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 23950592280298).
rpz_opened_file(f14, r0, p2, "/etc/ld.so.cache", 1, false, 23950593464498).
rpz_opened_file(f15, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 23950594233398).
rpz_opened_file(f16, r0, p2, "/usr/lib/locale/locale-archive", 1, false, 23950596643998).
rpz_opened_file(f17, r0, p2, "/etc/localtime", 1, false, 23950597286298).
