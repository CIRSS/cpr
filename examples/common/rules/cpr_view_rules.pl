

file_mode_read(1).
file_mode_read(3).
file_mode_write(2).
file_mode_write(3).

cpr_file_read(AccessID, RunID, ProcessID, PathIndex, Path, PathRole) :-
    cpr_accessed_path(AccessID, RunID, Path, PathIndex, PathRole),
    cpr_file_open(AccessID, _, ProcessID, _, FileMode, false, _),
    file_mode_read(FileMode).

cpr_file_write(AccessID, RunID, ProcessID, PathIndex, Path, PathRole) :-
    cpr_accessed_path(AccessID, RunID, Path, PathIndex, PathRole),
    cpr_file_open(AccessID, _, ProcessID, _, FileMode, false, _),
    file_mode_write(FileMode).

cpr_data_file_role(in).
cpr_data_file_role(out).
cpr_data_file_role(tmp).

:- table cpr_data_file/3.
cpr_data_file(PathIndex, Path, PathRole) :-
    cpr_accessed_path(_, _, Path, PathIndex, PathRole),
    cpr_data_file_role(PathRole).

:- table cpr_process/4.
cpr_process(ProcessID, ParentID, ExecID, Path) :-
    cpr_process(ProcessID, ParentID, _, false, _, _),
    cpr_execution(ExecID, _, ProcessID, _, _, _),
    cpr_accessed_path(ExecID, _, Path, _, _).

