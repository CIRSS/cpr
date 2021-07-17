# Show metadata about the run

    echo "Show metadata about the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>
        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT ?run ?name
        WHERE {
            ?run cpr:RunName ?name .
        } ORDER BY ?name

__END_QUERY__

