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
    SELECT DISTINCT ?file
    WHERE {
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Read .
        ?access os:resourceRole "in" .
        ?access os:accessPath ?file .
    } 
'''}}

{{ query "cpr_select_output_files" '''
    SELECT DISTINCT ?file
    WHERE {
        ?access rdf:type os:FileAccess .
        ?access os:accessMode cpr:Write .
        ?access os:resourceRole "out" .
        ?access os:accessPath ?file .
    } 
'''}}
