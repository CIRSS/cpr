
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).
rpz_process(p3, p2, r0, true, 0, nil).
rpz_process(p4, p2, r0, true, 0, nil).
rpz_process(p5, p2, r0, true, 0, nil).
rpz_process(p6, p5, r0, true, 0, nil).
rpz_process(p7, p2, r0, true, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/wt-prov-model/examples/02-hello-go/./run.sh', '/mnt/wt-prov-model/examples/02-hello-go', nil).
rpz_execution(e2, r0, p2, '/mnt/wt-prov-model/examples/02-hello-go/./bin/hello_go', '/mnt/wt-prov-model/examples/02-hello-go', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, './bin/hello_go').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o22, r0, p2, '/mnt/wt-prov-model/examples/02-hello-go', 4, true, nil).
rpz_file_open(o23, r0, p2, '/mnt/wt-prov-model/examples/02-hello-go/bin/hello_go', 1, false, nil).
rpz_file_open(o24, r0, p2, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', 1, false, nil).
rpz_file_open(o25, r0, p3, '/mnt/wt-prov-model/examples/02-hello-go', 4, true, nil).
rpz_file_open(o26, r0, p4, '/mnt/wt-prov-model/examples/02-hello-go', 4, true, nil).
rpz_file_open(o27, r0, p5, '/mnt/wt-prov-model/examples/02-hello-go', 4, true, nil).
rpz_file_open(o28, r0, p6, '/mnt/wt-prov-model/examples/02-hello-go', 4, true, nil).
rpz_file_open(o29, r0, p7, '/mnt/wt-prov-model/examples/02-hello-go', 4, true, nil).
rpz_file_open(o30, r0, p2, '/proc/self/exe', 24, false, nil).
