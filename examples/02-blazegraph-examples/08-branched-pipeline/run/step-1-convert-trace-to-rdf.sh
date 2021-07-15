# Convert the ReproZip trace to RDF triples

    # convert Reprozip reprozip trace to RDF triples in Turtle format
	cpr convert -name=08-branched-pipeline -noroot -notimestamps -from reprozip -to triples -src ./run/.reprozip-trace -dest ./run/.scratch/trace.ttl

    # print out the Turtle file
    cat ./run/.scratch/trace.ttl

