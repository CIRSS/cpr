#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

set_prolog_flag(unknown, fail).

['facts.d/trace_facts'].
['facts.d/trace_views'].
['../common/rules/json_rules'].
['../common/rules/prov_rules'].
['../common/rules/provone_rules'].

[user].
json :-

    json_start_object(),
        json_array_start('@context'),
            json_single_property_object('prov', 'http://www.w3.org/ns/prov#'), comma,
            json_single_property_object('provone', 'http://purl.dataone.org/provone/2015/01/15/ontology#'), comma,
            json_single_property_object('wt', 'http://wholetale.org/ontology/wt#'), comma,
            json_single_property_object('tale', 'http://wholetale.org/tale2035/version1021#'), comma,
            json_single_property_object('run', 'http://wholetale.org/tale2035/version1021/run1119#'),
        json_array_end(), comma,
        json_array_start('@graph'),
            json_start_object(),
                json_property('@id', 'run:execution_1'), comma,
                json_property('@type', 'provone:Execution'), comma,
                json_array_start('prov:used'),
                    provone_used_data(),
                json_array_end(), comma,
                json_array_start('prov:generated'),
                    provone_generated_data(),
                json_array_end(),
            json_end(),
        json_array_end(),
    json_end(), nl.

end_of_file.

json.

END_XSB_STDIN
