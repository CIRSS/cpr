

file_mode_read(1).
file_mode_read(3).
file_mode_write(2).
file_mode_write(3).

wt_file_read(AccessID, ProcessID, FileIndex, FilePath) :-
    wt_accessed(AccessID, FilePath, FileIndex),
    rpz_opened(AccessID, _, ProcessID, _, FileMode, false, _),
    file_mode_read(FileMode).

wt_file_write(AccessID, ProcessID, FileIndex, FilePath) :-
    wt_accessed(AccessID, FilePath, FileIndex),
    rpz_opened(AccessID, _, ProcessID, _, FileMode, false, _),
    file_mode_write(FileMode).
