:- import concat_atom/2 from string.

provone_used_data() :-
    wt_data_file(_, FilePath, in),
    comma,
    json_start_object(),
    concat_atom(['file://', FilePath], FileUri),
    json_property('@id', FileUri), comma,
        json_property('@type', 'provone:Data'),
    json_end(),
    fail
    ;
    true.

provone_generated_data() :-
    wt_data_file(_, FilePath, out),
    comma,
    json_start_object(),
        concat_atom(['file://', FilePath], FileUri),
        json_property('@id', FileUri), comma,
        json_property('@type', 'provone:Data'), comma,
        json_property('prov:wasGeneratedBy', 'tale_execution'),
    json_end(),
    fail
    ;
    true.
