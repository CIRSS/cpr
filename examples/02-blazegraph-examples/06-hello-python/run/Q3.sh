# List the files opened for writing during the run

    echo "Files opened for writing during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>

        SELECT DISTINCT ?writer ?file ?role
        WHERE {
            ?access rdf:type cpr:FileAccess .
            ?access cpr:AccessMode cpr:Write .
            ?process cpr:Performed ?access.
            ?exec cpr:ExecProcess ?process .
            ?exec cpr:ExecFile ?writer .
            ?access cpr:FilePath ?file .
            ?access cpr:FileRole ?role .
    } ORDER BY ?writer ?file ?role

__END_QUERY__

