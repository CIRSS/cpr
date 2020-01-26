
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, 84188738029598).
rpz_process(p2, p1, r0, false, 0, 84188775826498).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", "./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 84188743080698).
rpz_executed_file(e2, r0, p2, "/bin/date", "date ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 84188778663298).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 84188738036598).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 84188738039298).
rpz_opened_file(f3, r0, p1, "/bin/bash", 1, false, 84188746590598).
rpz_opened_file(f4, r0, p1, "/bin/bash", 1, false, 84188746641498).
rpz_opened_file(f5, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 84188746652198).
rpz_opened_file(f6, r0, p1, "/etc/ld.so.cache", 1, false, 84188747903998).
rpz_opened_file(f7, r0, p1, "/lib/x86_64-linux-gnu/libtinfo.so.5", 1, false, 84188749054198).
rpz_opened_file(f8, r0, p1, "/lib/x86_64-linux-gnu/libdl.so.2", 1, false, 84188750162698).
rpz_opened_file(f9, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 84188751278998).
rpz_opened_file(f10, r0, p1, "/dev/tty", 3, false, 84188753463298).
rpz_opened_file(f11, r0, p1, "/usr/lib/locale/locale-archive", 1, false, 84188753962998).
rpz_opened_file(f12, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/01-date-cmd", 8, true, 84188758543098).
rpz_opened_file(f13, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/.", 8, true, 84188759244898).
rpz_opened_file(f14, r0, p1, "/home", 8, true, 84188759377998).
rpz_opened_file(f15, r0, p1, "/home/tmcphill", 8, true, 84188759498498).
rpz_opened_file(f16, r0, p1, "/home/tmcphill/GitRepos", 8, false, 84188759896698).
rpz_opened_file(f17, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model", 8, true, 84188760600198).
rpz_opened_file(f18, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, 84188761269798).
rpz_opened_file(f19, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/01-date-cmd", 8, true, 84188761979098).
rpz_opened_file(f20, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, 84188762660298).
rpz_opened_file(f21, r0, p1, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 1, false, 84188762928298).
rpz_opened_file(f22, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", 1, false, 84188766252198).
rpz_opened_file(f23, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", 8, false, 84188766950598).
rpz_opened_file(f24, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/.", 8, true, 84188771343998).
rpz_opened_file(f25, r0, p1, "/bin/date", 8, false, 84188772307598).
rpz_opened_file(f26, r0, p1, "/bin/date", 8, false, 84188772430298).
rpz_opened_file(f27, r0, p1, "/bin/date", 8, false, 84188772987898).
rpz_opened_file(f28, r0, p1, "/bin/date", 8, false, 84188773107698).
rpz_opened_file(f29, r0, p1, "/bin/date", 8, false, 84188773633098).
rpz_opened_file(f30, r0, p1, "/bin/date", 8, false, 84188773791798).
rpz_opened_file(f31, r0, p1, "/bin/date", 8, false, 84188773911298).
rpz_opened_file(f32, r0, p1, "/bin/date", 8, false, 84188774438998).
rpz_opened_file(f33, r0, p1, "/bin/date", 8, false, 84188774558898).
rpz_opened_file(f34, r0, p1, "/bin/date", 8, false, 84188775090098).
rpz_opened_file(f35, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 84188775834998).
rpz_opened_file(f36, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 84188778941098).
rpz_opened_file(f37, r0, p2, "/etc/ld.so.cache", 1, false, 84188779530798).
rpz_opened_file(f38, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 84188780119898).
rpz_opened_file(f39, r0, p2, "/usr/lib/locale/locale-archive", 1, false, 84188782201698).
rpz_opened_file(f40, r0, p2, "/etc/localtime", 1, false, 84188782999798).
