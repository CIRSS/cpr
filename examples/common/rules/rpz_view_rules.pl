

file_mode_read(1).
file_mode_read(3).
file_mode_write(2).
file_mode_write(3).

wt_file_read(AccessID, RunID, ProcessID, PathIndex, Path, PathRole) :-
    wt_accessed_path(AccessID, RunID, Path, PathIndex, PathRole),
    rpz_file_open(AccessID, _, ProcessID, _, FileMode, false, _),
    file_mode_read(FileMode).

wt_file_write(AccessID, RunID, ProcessID, PathIndex, Path, PathRole) :-
    wt_accessed_path(AccessID, RunID, Path, PathIndex, PathRole),
    rpz_file_open(AccessID, _, ProcessID, _, FileMode, false, _),
    file_mode_write(FileMode).

wt_data_file_role(in).
wt_data_file_role(out).
wt_data_file_role(tmp).

:- table wt_data_file/3.
wt_data_file(PathIndex, Path, PathRole) :-
    wt_accessed_path(_, _, Path, PathIndex, PathRole),
    wt_data_file_role(PathRole).

:- table wt_process/3.
wt_process(ProcessID, ExecID, Path) :-
    rpz_process(ProcessID, _, _, false, _, _),
    rpz_execution(ExecID, _, ProcessID, _, _, _),
    wt_accessed_path(ExecID, _, Path, _, _).
