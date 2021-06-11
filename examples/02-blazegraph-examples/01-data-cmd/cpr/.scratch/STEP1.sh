# Convert trace to RDF triples

    # convert Reprozip reprozip trace to RDF triples in Turtle format
	cpr convert -noroot -notimestamps -from reprozip -to triples -src .reprozip-trace -dest ./cpr/trace.ttl

    # print out the Turtle file
    cat ./cpr/trace.ttl

