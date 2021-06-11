# List the files opened for reading during the run

    echo "Programs opened for reading during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>

        SELECT DISTINCT ?file ?role
        WHERE {
            ?access rdf:type cpr:FileAccess .
            ?access cpr:AccessMode cpr:Read .
            ?access cpr:FilePath ?file .
            ?access cpr:FileRole ?role .
    } ORDER BY ?file ?role

__END_QUERY__

