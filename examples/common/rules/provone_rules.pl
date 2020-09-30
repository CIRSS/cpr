:- import concat_atom/2 from string.

provone_file_uri(FileID, FileUri) :-
    concat_atom(['run:data_file_', FileID], FileUri).

provone_used_data() :-
    json_comma_init(1, ''),
    cpr_data_file(FileID, FilePath, in),
	provone_file_uri(FileID, FileUri),
    json_comma(1),
    json_start_object(),
        json_property('@id', FileUri), comma,
        json_property('@type', 'wt:DataFile'), comma,
        json_property('wt:FilePath', FilePath),
    json_end(),
    fail
    ;
    true.

provone_generated_data() :-
    json_comma_init(2, ''),
    cpr_data_file(FileID, FilePath, out),
	provone_file_uri(FileID, FileUri),
    json_comma(2),
    json_start_object(),
        json_property('@id', FileUri), comma,
        json_property('@type', 'wt:DataFile'), comma,
        json_property('wt:FilePath', FilePath),
    json_end(),
    fail
    ;
    true.

