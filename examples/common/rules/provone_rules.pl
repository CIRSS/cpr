:- import concat_atom/2 from string.

provone_file_uri(FileID, FileUri) :-
    concat_atom(['run:data_file_', FileID], FileUri).

provone_used_data() :-
    json_comma_init(''),
    wt_data_file(FileID, FilePath, in),
	provone_file_uri(FileID, FileUri),
    json_comma(),
    json_start_object(),
    json_property('@id', FileUri), comma,
    json_property('@type', 'wt:DataFile'), comma,
    json_property('wt:FilePath', FilePath),
    json_end(),
    fail
    ;
    true.

provone_generated_data() :-
    wt_data_file(FileID, FilePath, out),
	provone_file_uri(FileID, FileUri),
    comma,
    json_start_object(),
        json_property('@id', FileUri), comma,
        json_property('@type', 'wt:DataFile'), comma,
        json_property('wt:FilePath', FilePath), comma,
        json_key('prov:wasGeneratedBy'), json_single_property_object('id', 'run:execution_1'),
    json_end(),
    fail
    ;
    true.
