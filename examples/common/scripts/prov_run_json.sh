#!/usr/bin/env bash -l

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

%set_prolog_flag(unknown, fail).

['facts/wt_facts'].
['facts/rpz_facts'].
['facts/rpz_views'].
['../common/rules/json_rules'].

[user].
json :-

    json_start(),
        json_array_start('@context'),
            json_start(),
                json_property('prov', 'http://www.w3.org/ns/prov#'),
            json_end(),
        json_array_end(), comma,
        json_array_start('@graph'),
            json_start(),
                json_property('@id', 'tale_execution'), comma,
                json_property('@type', 'prov:Activity'),
            json_end(),
        json_array_end(),
    json_end(), nl.

end_of_file.

json.

END_XSB_STDIN
