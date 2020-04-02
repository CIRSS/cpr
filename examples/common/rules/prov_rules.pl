:- import concat_atom/2 from string.

prov_file_uri(FilePath, FileUri) :-
    concat_atom(['file://', FilePath], FileUri).

prov_used_entity_references() :-
    json_comma_init(''),
    wt_data_file(_, FilePath, in),
    prov_file_uri(FilePath, FileUri),
    json_comma(),
    json_start_object(),
        json_property('@id', FileUri),
    json_end(),
    fail
    ;
    true.

prov_used_entities() :-
    wt_data_file(_, FilePath, in),
    prov_file_uri(FilePath, FileUri),
    comma,
    json_start_object(),
        json_property('@id', FileUri), comma,
        json_property('@type', 'prov:Entity'),
    json_end(),
    fail
    ;
    true.

prov_generated_entities() :-
    wt_data_file(_, FilePath, out),
    prov_file_uri(FilePath, FileUri),
    comma,
    json_start_object(),
        json_property('@id', FileUri), comma,
        json_property('@type', 'prov:Entity'), comma,
        json_property('prov:wasGeneratedBy', 'tale_execution'),
    json_end(),
    fail
    ;
    true.
