# List the programs executed during the run

    echo "Programs executed during the run:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT DISTINCT ?program
        WHERE {
            ?execution os:executedFile ?program .
        } ORDER BY ?program

__END_QUERY__

