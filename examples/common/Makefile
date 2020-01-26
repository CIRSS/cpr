
.PHONY: clean
clean:
	rm -rfv bin
	rm -rfv outputs
	rm -rfv .reprozip-trace
	rm -rfv facts

build:

.PHONY: dirs
dirs:
	mkdir -p  bin facts outputs

.PHONY: run
run: dirs
	./run.sh

record: dirs
	reprozip trace --overwrite ./run.sh

extract: dirs
	rpz2prolog .reprozip-trace > facts/rpz_facts.pl

