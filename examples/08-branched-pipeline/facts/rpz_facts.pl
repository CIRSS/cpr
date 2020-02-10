
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).
rpz_process(p3, p1, r0, false, 0, nil).
rpz_process(p4, p1, r0, false, 0, nil).
rpz_process(p5, p1, r0, false, 0, nil).
rpz_process(p6, p1, r0, false, 0, nil).
rpz_process(p7, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed(ExecutionID, RunID, ProcessID, FilePath, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed(e1, r0, p1, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/./run.sh', './run.sh ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).
rpz_executed(e2, r0, p2, '/bin/cat', 'cat inputs/i1.txt inputs/i2.txt ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).
rpz_executed(e3, r0, p3, '/bin/cat', 'cat inputs/i1.txt inputs/i2.txt inputs/i3.txt ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).
rpz_executed(e4, r0, p4, '/bin/cat', 'cat inputs/i4.txt ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).
rpz_executed(e5, r0, p5, '/bin/cat', 'cat temp/t12.txt ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).
rpz_executed(e6, r0, p6, '/bin/cat', 'cat temp/t123.txt temp/t4.txt ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).
rpz_executed(e7, r0, p7, '/bin/cat', 'cat temp/t4.txt ', '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened(FileID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened(o35, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', 4, true, nil).
rpz_opened(o36, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t12.txt', 2, false, nil).
rpz_opened(o37, r0, p2, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o38, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o39, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_opened(o40, r0, p2, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_opened(o41, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/inputs/i1.txt', 1, false, nil).
rpz_opened(o42, r0, p2, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/inputs/i2.txt', 1, false, nil).
rpz_opened(o43, r0, p3, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', 4, true, nil).
rpz_opened(o44, r0, p3, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t123.txt', 2, false, nil).
rpz_opened(o45, r0, p3, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o46, r0, p3, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o47, r0, p3, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_opened(o48, r0, p3, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_opened(o49, r0, p3, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/inputs/i1.txt', 1, false, nil).
rpz_opened(o50, r0, p3, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/inputs/i2.txt', 1, false, nil).
rpz_opened(o51, r0, p3, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/inputs/i3.txt', 1, false, nil).
rpz_opened(o52, r0, p4, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', 4, true, nil).
rpz_opened(o53, r0, p4, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t4.txt', 2, false, nil).
rpz_opened(o54, r0, p4, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o55, r0, p4, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o56, r0, p4, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_opened(o57, r0, p4, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_opened(o58, r0, p4, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/inputs/i4.txt', 1, false, nil).
rpz_opened(o59, r0, p5, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', 4, true, nil).
rpz_opened(o60, r0, p5, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/outputs/o12.txt', 2, false, nil).
rpz_opened(o61, r0, p5, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o62, r0, p5, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o63, r0, p5, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_opened(o64, r0, p5, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_opened(o65, r0, p5, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t12.txt', 1, false, nil).
rpz_opened(o66, r0, p6, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', 4, true, nil).
rpz_opened(o67, r0, p6, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/outputs/o1234.txt', 2, false, nil).
rpz_opened(o68, r0, p6, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o69, r0, p6, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o70, r0, p6, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_opened(o71, r0, p6, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_opened(o72, r0, p6, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t123.txt', 1, false, nil).
rpz_opened(o73, r0, p6, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t4.txt', 1, false, nil).
rpz_opened(o74, r0, p7, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline', 4, true, nil).
rpz_opened(o75, r0, p7, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/outputs/o4.txt', 2, false, nil).
rpz_opened(o76, r0, p7, '/lib/x86_64-linux-gnu/ld-2.24.so', 1, false, nil).
rpz_opened(o77, r0, p7, '/etc/ld.so.cache', 1, false, nil).
rpz_opened(o78, r0, p7, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_opened(o79, r0, p7, '/usr/lib/locale/locale-archive', 1, false, nil).
rpz_opened(o80, r0, p7, '/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/08-branched-pipeline/temp/t4.txt', 1, false, nil).
