#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts.d/wt_facts'].
['facts.d/rpz_facts'].
['facts.d/rpz_views'].
['../common/rules/json_rules'].
['../common/rules/prov_rules'].
['../common/rules/provone_rules'].

[user].
json :-

    json_start_object(),
        json_array_start('@context'),
            json_start_object(),
                json_property('prov', 'http://www.w3.org/ns/prov#'),
            json_end(), comma,
            json_start_object(),
                json_property('provone', 'http://purl.dataone.org/provone/2015/01/15/ontology#'),
            json_end(),
        json_array_end(), comma,
        json_array_start('@graph'),
            json_start_object(),
                json_property('@id', 'tale_execution'), comma,
                json_property('@type', 'provone:Execution'), comma,
                json_array_start('prov:used'),
                    prov_used_entity_references(),
                json_array_end(),
            json_end(),
            provone_used_data(),
            provone_generated_data(),
        json_array_end(),
    json_end(), nl.

end_of_file.

json.

END_XSB_STDIN
