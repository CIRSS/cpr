

rpz_file_read(AccessID, ProcessID, FileIndex, FilePath) :-
    rpz_accessed(AccessID, FilePath, FileIndex),
    rpz_opened(AccessID, _, ProcessID, _, 1, false, _).

rpz_file_write(AccessID, ProcessID, FileIndex, FilePath) :-
    rpz_accessed(AccessID, FilePath, FileIndex),
    rpz_opened(AccessID, _, ProcessID, _, 2, false, _).
