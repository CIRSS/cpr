{{ prefix "cpr" "http://cirss.illinois.edu/ns/cpr#" }}
{{ prefix "os" "http://cirss.illinois.edu/ns/cpr/os#" }}
{{ prefix "wt" "http://cirss.illinois.edu/ns/cpr/wt#" }}

{{ macro "cpr_run_node_style" '''
    node[shape=box style="filled" fillcolor="#FFFFFF" peripheries=2 fontname=Courier]
''' }}

{{ macro "os_process_node_style" '''
    node[shape=box style="filled" fillcolor="#CCFFCC" peripheries=1 fontname=Courier]
''' }}

{{ macro "os_file_node_style" '''
    node[shape=box style="rounded,filled" fillcolor="#FFFFCC" peripheries=1 fontname=Helvetica]
''' }}

{{ query "cpr_select_run_info" '''
	SELECT ?name
	WHERE {
		?run cpr:RunName ?name .
	} ORDER BY ?name
'''}}


{{ query "cpr_select_run_info_pair" '''
	SELECT ?run ?name
	WHERE {
		?run cpr:RunName ?name .
	} ORDER BY ?name
'''}}

{{ query "cpr_select_files_written" '''
    SELECT DISTINCT ?writer ?file ?role
    WHERE {
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Write .
        ?process os:performedAccess ?access.
        ?exec os:startedProcess ?process .
        ?exec os:executedFile ?writer .
        ?access os:accessPath ?file .
        ?access os:resourceRole ?role .
    } ORDER BY ?writer ?file ?role
'''}}

{{ query "cpr_select_input_files" '''
    SELECT DISTINCT ?resource ?filepath
    WHERE {
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Read .
        ?access os:resourceRole "in" .
        ?access os:resourcePath ?resource .
        ?resource os:relativePath ?filepath .
    } 
'''}}

{{ query "cpr_select_output_files" '''
    SELECT DISTINCT ?resource ?filepath
    WHERE {
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Write .
        ?access os:resourceRole "out" .
        ?access os:resourcePath ?resource .
        ?resource os:relativePath ?filepath .
    } 
'''}}


{{ query "cpr_select_data_files" '''
    SELECT DISTINCT ?resource ?filepath
    WHERE {
        ?access rdf:type os:FileAccess .
        ?access os:resourceRole ?role .
        FILTER (?role="in" || ?role="out" || ?role="tmp") .
        ?access os:resourcePath ?resource .
        ?resource os:relativePath ?filepath .
    } 
'''}}

{{ query "cpr_data_io_process_nodes" '''
    SELECT DISTINCT ?process ?programpath
    WHERE {
        ?process rdf:type os:Process .
        ?process os:performedAccess ?access .
        ?access rdf:type os:FileAccess .
        ?access os:resourceRole ?role .
        FILTER (?role="in" || ?role="out" || ?role="tmp") .
        ?execution os:startedProcess ?process .
        ?execution os:executedFile ?program .
        ?rp os:absolutePath ?program .
        ?rp os:relativePath ?programpath .
    } 
'''}}

{{ query "cpr_data_file_process_edges" '''
    SELECT DISTINCT ?process ?resource
    WHERE {
        ?process rdf:type os:Process .
        ?process os:performedAccess ?access .
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Read .
        ?access os:resourceRole ?role .
        FILTER (?role="in" || ?role="out" || ?role="tmp") .
        ?access os:resourcePath ?resource .
    } 
'''}}

{{ query "cpr_process_data_file_edges" '''
    SELECT DISTINCT ?process ?resource
    WHERE {
        ?process rdf:type os:Process .
        ?process os:performedAccess ?access .
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Write .
        ?access os:resourceRole ?role .
        FILTER (?role="in" || ?role="out" || ?role="tmp") .
        ?access os:resourcePath ?resource .
    } 
'''}}



{{ macro "cpr_run_input_file_nodes" '''                     \\
    {{ range $Row := cpr_select_input_files | rows }}       \\
        {{ gv_labeled_node (index $Row 0) (index $Row 1) }}
    {{ end }}                                               \\
''' }}                                                      \\

{{ macro "cpr_run_output_file_nodes" '''                    \\
    {{ range $Row := cpr_select_output_files | rows }}      \\
        {{ gv_labeled_node (index $Row 0) (index $Row 1) }}
    {{ end }}                                               \\
''' }}                                                      \\


{{ macro "cpr_run_input_file_edges" "RunId" '''             \\
    {{ range $Row := cpr_select_input_files | rows }}       \\
        {{ gv_edge (index $Row 0) $RunId }}                  
    {{ end }}                                               \\
''' }}                                                      \\

{{ macro "cpr_run_output_file_edges" "RunId" '''              \\
    {{ range $Row := cpr_select_output_files | rows }}      \\
        {{ gv_edge $RunId (index $Row 0) }}                  
    {{ end }}                                               \\
''' }}                                                      \\

{{ macro "cpr_data_file_nodes" '''                          \\
    {{ range $Row := cpr_select_data_files | rows }}        \\
        {{ gv_labeled_node (index $Row 0) (index $Row 1) }}                  
    {{ end }}                                               \\
''' }}                                                      \\

{{ macro "cpr_data_io_process_nodes" '''                    \\
    {{ range $Row := cpr_data_io_process_nodes | rows }}    \\
        {{ gv_labeled_node (index $Row 0) (index $Row 1) }}                  
    {{ end }}                                               \\
''' }}                                                      \\

{{ macro "cpr_process_input_file_edges" '''                 \\
    {{ range $Row := cpr_data_file_process_edges | rows }}  \\
        {{ gv_edge (index $Row 1) (index $Row 0) }}                  
    {{ end }}                                               \\
''' }}                                                      \\

{{ macro "cpr_process_output_file_edges" '''                \\
    {{ range $Row := cpr_process_data_file_edges | rows }}  \\
        {{ gv_edge  (index $Row 0) (index $Row 1) }}                  
    {{ end }}                                               \\
''' }}                                                      \\
