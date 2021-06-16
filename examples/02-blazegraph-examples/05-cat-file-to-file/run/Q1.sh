# List the programs executed during the run

    echo "Programs executed during the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>

        SELECT DISTINCT ?program
        WHERE {
            ?execution cpr:ExecFile ?program .
        } ORDER BY ?program

__END_QUERY__

