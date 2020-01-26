
clean:
	rm -rfv bin
	rm -rfv .reprozip-trace
	rm -rfv facts

build:

run:
	./run.sh

record:
	mkdir -p facts
	reprozip trace --overwrite ./run.sh

extract:
	rpz2prolog .reprozip-trace > facts/rpz_facts.pl

