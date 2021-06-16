# List the files opened for reading during the run

    echo "Files opened for reading during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>

        SELECT DISTINCT ?reader ?file ?role
        WHERE {
            ?access rdf:type cpr:FileAccess .
            ?access cpr:AccessMode cpr:Read .
            ?process cpr:Performed ?access.
            ?exec cpr:ExecProcess ?process .
            ?exec cpr:ExecFile ?reader .
            ?access cpr:FilePath ?file .
            ?access cpr:FileRole ?role .

    } ORDER BY ?reader ?file ?role

__END_QUERY__

