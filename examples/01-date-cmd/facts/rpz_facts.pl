
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, 92278368109898).
rpz_process(p2, p1, r0, false, 0, 92278455071398).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", "./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 92278378439498).
rpz_executed_file(e2, r0, p2, "/bin/date", "date ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 92278462221898).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 92278368124098).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 92278368130598).
rpz_opened_file(f3, r0, p1, "/bin/bash", 1, false, 92278386376798).
rpz_opened_file(f4, r0, p1, "/bin/bash", 1, false, 92278386483298).
rpz_opened_file(f5, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 92278386504998).
rpz_opened_file(f6, r0, p1, "/etc/ld.so.cache", 1, false, 92278388977998).
rpz_opened_file(f7, r0, p1, "/lib/x86_64-linux-gnu/libtinfo.so.5", 1, false, 92278391579398).
rpz_opened_file(f8, r0, p1, "/lib/x86_64-linux-gnu/libdl.so.2", 1, false, 92278395964798).
rpz_opened_file(f9, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 92278399619398).
rpz_opened_file(f10, r0, p1, "/dev/tty", 3, false, 92278406239798).
rpz_opened_file(f11, r0, p1, "/usr/lib/locale/locale-archive", 1, false, 92278407826098).
rpz_opened_file(f12, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/01-date-cmd", 8, true, 92278418874298).
rpz_opened_file(f13, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/.", 8, true, 92278419813098).
rpz_opened_file(f14, r0, p1, "/home", 8, true, 92278419988398).
rpz_opened_file(f15, r0, p1, "/home/tmcphill", 8, true, 92278420153698).
rpz_opened_file(f16, r0, p1, "/home/tmcphill/GitRepos", 8, false, 92278420679498).
rpz_opened_file(f17, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model", 8, true, 92278421585698).
rpz_opened_file(f18, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, 92278422469598).
rpz_opened_file(f19, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/01-date-cmd", 8, true, 92278423371198).
rpz_opened_file(f20, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/06-hello-python", 8, true, 92278426324698).
rpz_opened_file(f21, r0, p1, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 1, false, 92278426732698).
rpz_opened_file(f22, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", 1, false, 92278432469998).
rpz_opened_file(f23, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/./run.sh", 8, false, 92278433616098).
rpz_opened_file(f24, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd/.", 8, true, 92278442165398).
rpz_opened_file(f25, r0, p1, "/bin/date", 8, false, 92278445011398).
rpz_opened_file(f26, r0, p1, "/bin/date", 8, false, 92278445376798).
rpz_opened_file(f27, r0, p1, "/bin/date", 8, false, 92278446931698).
rpz_opened_file(f28, r0, p1, "/bin/date", 8, false, 92278447269098).
rpz_opened_file(f29, r0, p1, "/bin/date", 8, false, 92278448819498).
rpz_opened_file(f30, r0, p1, "/bin/date", 8, false, 92278449207298).
rpz_opened_file(f31, r0, p1, "/bin/date", 8, false, 92278449529898).
rpz_opened_file(f32, r0, p1, "/bin/date", 8, false, 92278451062898).
rpz_opened_file(f33, r0, p1, "/bin/date", 8, false, 92278451413798).
rpz_opened_file(f34, r0, p1, "/bin/date", 8, false, 92278453129498).
rpz_opened_file(f35, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/01-date-cmd", 4, true, 92278455108798).
rpz_opened_file(f36, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 92278462631798).
rpz_opened_file(f37, r0, p2, "/etc/ld.so.cache", 1, false, 92278464267898).
rpz_opened_file(f38, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 92278466097198).
rpz_opened_file(f39, r0, p2, "/usr/lib/locale/locale-archive", 1, false, 92278471893198).
rpz_opened_file(f40, r0, p2, "/etc/localtime", 1, false, 92278473221298).
