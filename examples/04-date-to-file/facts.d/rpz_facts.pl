
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).
rpz_process(p3, p1, r0, false, 0, nil).
rpz_process(p4, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/cpr/examples/04-date-to-file/./run.sh', '/mnt/cpr/examples/04-date-to-file', nil).
rpz_execution(e2, r0, p2, '/bin/date', '/mnt/cpr/examples/04-date-to-file', nil).
rpz_execution(e3, r0, p4, '/bin/cat', '/mnt/cpr/examples/04-date-to-file', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, 'date').
rpz_argument(e3, 0, 'cat').
rpz_argument(e3, 1, '/mnt/cpr/examples/04-date-to-file/outputs/date.txt').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o31, r0, p2, '/mnt/cpr/examples/04-date-to-file', 4, true, nil).
rpz_file_open(o32, r0, p2, '/mnt/cpr/examples/04-date-to-file/outputs/date.txt', 2, false, nil).
rpz_file_open(o33, r0, p2, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o34, r0, p2, '/tmp/_MEINBuI1d', 8, true, nil).
rpz_file_open(o35, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o36, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o37, r0, p2, '/etc/localtime', 1, false, nil).
rpz_file_open(o43, r0, p3, '/mnt/cpr/examples/04-date-to-file', 4, true, nil).
rpz_file_open(o55, r0, p4, '/mnt/cpr/examples/04-date-to-file', 4, true, nil).
rpz_file_open(o56, r0, p4, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o57, r0, p4, '/tmp/_MEINBuI1d', 8, true, nil).
rpz_file_open(o58, r0, p4, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o59, r0, p4, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o60, r0, p4, '/mnt/cpr/examples/04-date-to-file/outputs/date.txt', 1, false, nil).
