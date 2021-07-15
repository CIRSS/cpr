# List the files opened for reading during the run

    echo "Files opened for reading during the run and their roles:"
    echo

    geist query --dataset traces --format table << __END_QUERY__

        PREFIX cpr: <http://cirss.illinois.edu/ns/cpr#>
        PREFIX os: <http://cirss.illinois.edu/ns/cpr/os#>

        SELECT DISTINCT ?reader ?file ?role
        WHERE {
            ?access rdf:type os:FileAccess .
            ?access os:accessMode cpr:Read .
            ?process os:performedAccess ?access.
            ?exec os:startedProcess ?process .
            ?exec os:executedFile ?reader .
            ?access os:resourcePath ?resource .
            ?resource os:relativePath ?file .
            ?access os:resourceRole ?role .

    } ORDER BY ?reader ?file ?role

__END_QUERY__

