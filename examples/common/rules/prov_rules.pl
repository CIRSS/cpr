

prov_used_entity_references() :-
    json_comma_init(''),
    wt_data_file(_, FilePath, in),
    json_comma(),
    json_start_object(),
        json_property('@id', FilePath),
    json_end(),
    fail
    ;
    true.

prov_used_entities() :-
    wt_data_file(_, FilePath, in),
    comma,
    json_start_object(),
        json_property('@id', FilePath), comma,
        json_property('@type', 'prov:Entity'),
    json_end(),
    fail
    ;
    true.

prov_generated_entities() :-
    wt_data_file(_, FilePath, out),
    comma,
    json_start_object(),
        json_property('@id', FilePath), comma,
        json_property('@type', 'prov:Entity'), comma,
        json_property('prov:wasGeneratedBy', 'tale_execution'),
    json_end(),
    fail
    ;
    true.
