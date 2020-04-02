:- import concat_atom/2 from string.

prov_used_entity_references() :-
    json_comma_init(''),
    wt_data_file(_, FilePath, in),
    json_comma(),
    json_start_object(),
        concat_atom(['file://', FilePath], FileUri),
        json_property('@id', FileUri),
    json_end(),
    fail
    ;
    true.

prov_used_entities() :-
    wt_data_file(_, FilePath, in),
    comma,
    json_start_object(),
        concat_atom(['file://', FilePath], FileUri),
        json_property('@id', FileUri), comma,
        json_property('@type', 'prov:Entity'),
    json_end(),
    fail
    ;
    true.

prov_generated_entities() :-
    wt_data_file(_, FilePath, out),
    comma,
    json_start_object(),
        concat_atom(['file://', FilePath], FileUri),
        json_property('@id', FileUri), comma,
        json_property('@type', 'prov:Entity'), comma,
        json_property('prov:wasGeneratedBy', 'tale_execution'),
    json_end(),
    fail
    ;
    true.
