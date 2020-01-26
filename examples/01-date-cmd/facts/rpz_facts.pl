
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, 85510771474598).
rpz_process(p2, p1, r0, false, 0, 85510808477098).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", "./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 85510777533498).
rpz_executed_file(e2, r0, p2, "/bin/date", "date ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 85510811403698).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 85510771485298).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 85510771490998).
rpz_opened_file(f3, r0, p1, "/bin/bash", 1, false, 85510781464898).
rpz_opened_file(f4, r0, p1, "/bin/bash", 1, false, 85510781519398).
rpz_opened_file(f5, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 85510781529598).
rpz_opened_file(f6, r0, p1, "/etc/ld.so.cache", 1, false, 85510782546598).
rpz_opened_file(f7, r0, p1, "/lib/x86_64-linux-gnu/libtinfo.so.5", 1, false, 85510783543198).
rpz_opened_file(f8, r0, p1, "/lib/x86_64-linux-gnu/libdl.so.2", 1, false, 85510784562798).
rpz_opened_file(f9, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 85510785456398).
rpz_opened_file(f10, r0, p1, "/dev/tty", 3, false, 85510787291698).
rpz_opened_file(f11, r0, p1, "/usr/lib/locale/locale-archive", 1, false, 85510787730598).
rpz_opened_file(f12, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/01-date-cmd", 8, true, 85510792078998).
rpz_opened_file(f13, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/.", 8, true, 85510792684698).
rpz_opened_file(f14, r0, p1, "/home", 8, true, 85510792804398).
rpz_opened_file(f15, r0, p1, "/home/tmcphill", 8, true, 85510792916598).
rpz_opened_file(f16, r0, p1, "/home/tmcphill/GitRepos", 8, false, 85510793340298).
rpz_opened_file(f17, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model", 8, true, 85510793972298).
rpz_opened_file(f18, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, 85510794604098).
rpz_opened_file(f19, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/01-date-cmd", 8, true, 85510795230798).
rpz_opened_file(f20, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, 85510795845998).
rpz_opened_file(f21, r0, p1, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 1, false, 85510796105798).
rpz_opened_file(f22, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", 1, false, 85510799207398).
rpz_opened_file(f23, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", 8, false, 85510799832798).
rpz_opened_file(f24, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/.", 8, true, 85510804343598).
rpz_opened_file(f25, r0, p1, "/bin/date", 8, false, 85510805276898).
rpz_opened_file(f26, r0, p1, "/bin/date", 8, false, 85510805393198).
rpz_opened_file(f27, r0, p1, "/bin/date", 8, false, 85510805882998).
rpz_opened_file(f28, r0, p1, "/bin/date", 8, false, 85510805993598).
rpz_opened_file(f29, r0, p1, "/bin/date", 8, false, 85510806481298).
rpz_opened_file(f30, r0, p1, "/bin/date", 8, false, 85510806592298).
rpz_opened_file(f31, r0, p1, "/bin/date", 8, false, 85510806702698).
rpz_opened_file(f32, r0, p1, "/bin/date", 8, false, 85510807215198).
rpz_opened_file(f33, r0, p1, "/bin/date", 8, false, 85510807326398).
rpz_opened_file(f34, r0, p1, "/bin/date", 8, false, 85510807814498).
rpz_opened_file(f35, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 85510808485198).
rpz_opened_file(f36, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 85510811584398).
rpz_opened_file(f37, r0, p2, "/etc/ld.so.cache", 1, false, 85510812291898).
rpz_opened_file(f38, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 85510812799698).
rpz_opened_file(f39, r0, p2, "/usr/lib/locale/locale-archive", 1, false, 85510814579698).
rpz_opened_file(f40, r0, p2, "/etc/localtime", 1, false, 85510815020798).
