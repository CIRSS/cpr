
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, 88838789411298).
rpz_process(p2, p1, r0, false, 0, 88838827465398).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/./run.sh", "./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 88838793862698).
rpz_executed_file(e2, r0, p2, "/bin/date", "date ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 88838833560598).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 4, true, 88838789418198).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 4, true, 88838789420698).
rpz_opened_file(f3, r0, p1, "/bin/bash", 1, false, 88838796700798).
rpz_opened_file(f4, r0, p1, "/bin/bash", 1, false, 88838796755798).
rpz_opened_file(f5, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 88838796766998).
rpz_opened_file(f6, r0, p1, "/etc/ld.so.cache", 1, false, 88838797619198).
rpz_opened_file(f7, r0, p1, "/lib/x86_64-linux-gnu/libtinfo.so.5", 1, false, 88838798207098).
rpz_opened_file(f8, r0, p1, "/lib/x86_64-linux-gnu/libdl.so.2", 1, false, 88838799297398).
rpz_opened_file(f9, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 88838800257898).
rpz_opened_file(f10, r0, p1, "/dev/tty", 3, false, 88838802262098).
rpz_opened_file(f11, r0, p1, "/usr/lib/locale/locale-archive", 1, false, 88838802752098).
rpz_opened_file(f12, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file", 8, true, 88838807491798).
rpz_opened_file(f13, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/.", 8, true, 88838808401498).
rpz_opened_file(f14, r0, p1, "/home", 8, true, 88838808537398).
rpz_opened_file(f15, r0, p1, "/home/tmcphill", 8, true, 88838808664398).
rpz_opened_file(f16, r0, p1, "/home/tmcphill/GitRepos", 8, false, 88838809110398).
rpz_opened_file(f17, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model", 8, true, 88838809812298).
rpz_opened_file(f18, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, 88838810543798).
rpz_opened_file(f19, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file", 8, true, 88838811337298).
rpz_opened_file(f20, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/03-hello-c", 8, true, 88838813661698).
rpz_opened_file(f21, r0, p1, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 1, false, 88838813997198).
rpz_opened_file(f22, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/./run.sh", 1, false, 88838817524398).
rpz_opened_file(f23, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/./run.sh", 8, false, 88838818265798).
rpz_opened_file(f24, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/.", 8, true, 88838822040698).
rpz_opened_file(f25, r0, p1, "/bin/date", 8, false, 88838823122798).
rpz_opened_file(f26, r0, p1, "/bin/date", 8, false, 88838823255098).
rpz_opened_file(f27, r0, p1, "/bin/date", 8, false, 88838823909398).
rpz_opened_file(f28, r0, p1, "/bin/date", 8, false, 88838824063198).
rpz_opened_file(f29, r0, p1, "/bin/date", 8, false, 88838824830298).
rpz_opened_file(f30, r0, p1, "/bin/date", 8, false, 88838825022798).
rpz_opened_file(f31, r0, p1, "/bin/date", 8, false, 88838825211298).
rpz_opened_file(f32, r0, p1, "/bin/date", 8, false, 88838826001498).
rpz_opened_file(f33, r0, p1, "/bin/date", 8, false, 88838826131998).
rpz_opened_file(f34, r0, p1, "/bin/date", 8, false, 88838826702398).
rpz_opened_file(f35, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file", 4, true, 88838827474498).
rpz_opened_file(f36, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt", 2, false, 88838831694598).
rpz_opened_file(f37, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 88838833866998).
rpz_opened_file(f38, r0, p2, "/etc/ld.so.cache", 1, false, 88838834904898).
rpz_opened_file(f39, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 88838836119698).
rpz_opened_file(f40, r0, p2, "/usr/lib/locale/locale-archive", 1, false, 88838838516598).
rpz_opened_file(f41, r0, p2, "/etc/localtime", 1, false, 88838839096398).
