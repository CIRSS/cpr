
%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_process(p1, nil, r0, false, 0, nil).
cpr_process(p2, p1, r0, false, 0, nil).
cpr_process(p3, p2, r0, true, 0, nil).
cpr_process(p4, p2, r0, true, 0, nil).
cpr_process(p5, p2, r0, true, 0, nil).
cpr_process(p6, p4, r0, true, 0, nil).
cpr_process(p7, p2, r0, true, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_execution(e1, r0, p1, '/mnt/cpr/examples/01-xsb-examples/02-hello-go/./run.sh', '/mnt/cpr/examples/01-xsb-examples/02-hello-go', nil).
cpr_execution(e2, r0, p2, '/mnt/cpr/examples/01-xsb-examples/02-hello-go/./bin/hello_go', '/mnt/cpr/examples/01-xsb-examples/02-hello-go', nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
cpr_argument(e1, 0, './run.sh').
cpr_argument(e2, 0, './bin/hello_go').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
cpr_file_open(o20, r0, p2, '/mnt/cpr/examples/01-xsb-examples/02-hello-go', 4, true, nil).
cpr_file_open(o21, r0, p2, '/mnt/cpr/examples/01-xsb-examples/02-hello-go/bin/hello_go', 1, false, nil).
cpr_file_open(o22, r0, p2, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', 1, false, nil).
cpr_file_open(o23, r0, p3, '/mnt/cpr/examples/01-xsb-examples/02-hello-go', 4, true, nil).
cpr_file_open(o24, r0, p4, '/mnt/cpr/examples/01-xsb-examples/02-hello-go', 4, true, nil).
cpr_file_open(o25, r0, p5, '/mnt/cpr/examples/01-xsb-examples/02-hello-go', 4, true, nil).
cpr_file_open(o26, r0, p6, '/mnt/cpr/examples/01-xsb-examples/02-hello-go', 4, true, nil).
cpr_file_open(o27, r0, p7, '/mnt/cpr/examples/01-xsb-examples/02-hello-go', 4, true, nil).
cpr_file_open(o28, r0, p2, '/proc/self/exe', 24, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
cpr_run(r0, '02-hello-go').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
cpr_path_role(r0, '/proc', i1, os).
cpr_path_role(r0, '/sys', i1, os).
cpr_path_role(r0, '.', i2, sw).
cpr_path_role(r0, '/tmp', i3, nul).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
cpr_accessed_path(e1, r0, './run.sh', i12, sw).
cpr_accessed_path(e2, r0, './bin/hello_go', i4, sw).
cpr_accessed_path(o20, r0, '.', i2, sw).
cpr_accessed_path(o21, r0, './bin/hello_go', i4, sw).
cpr_accessed_path(o22, r0, '/sys/kernel/mm/transparent_hugepage/hpage_pmd_size', i6, os).
cpr_accessed_path(o23, r0, '.', i2, sw).
cpr_accessed_path(o24, r0, '.', i2, sw).
cpr_accessed_path(o25, r0, '.', i2, sw).
cpr_accessed_path(o26, r0, '.', i2, sw).
cpr_accessed_path(o27, r0, '.', i2, sw).
cpr_accessed_path(o28, r0, '/proc/self/exe', i10, os).
