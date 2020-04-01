


prov_used_properties() :-
    wt_data_file(_, FilePath, in),
    json_property('prov:used', FilePath),
    fail
    ;
    true.

prov_used_entities() :-
    wt_data_file(_, FilePath, in),
    comma,
    json_start(),
        json_property('@id', FilePath), comma,
        json_property('@type', 'prov:Entity'),
    json_end(),
    fail
    ;
    true.

prov_generated_entities() :-
    wt_data_file(_, FilePath, out),
    comma,
    json_start(),
        json_property('@id', FilePath), comma,
        json_property('@type', 'prov:Entity'), comma,
        json_property('prov:wasGeneratedBy', 'tale_execution'),
    json_end(),
    fail
    ;
    true.
