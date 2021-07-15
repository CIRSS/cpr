# List the programs executed during the run

    echo "Programs executed during the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT DISTINCT ?program
        WHERE {
			?execution rdf:type os:Execution .
			?execution os:resourcePath ?resource .
            ?resource os:relativePath ?program .
        } ORDER BY ?program

__END_QUERY__

