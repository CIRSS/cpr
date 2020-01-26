
RPZ_GRAPH = graphs/rpz_graph

GRAPHS = $(RPZ_GRAPH).dot
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

.PHONY: clean
clean:
	rm -rfv bin outputs .reprozip-trace facts graphs

build:

.PHONY: dirs
dirs:
	mkdir -p  bin facts outputs graphs

.PHONY: run
run: dirs
	./run.sh

record: dirs
	reprozip trace --overwrite ./run.sh

extract: dirs
	rpz2prolog .reprozip-trace > facts/rpz_facts.pl

graph: dirs $(GRAPHS)

$(RPZ_GRAPH).dot:
	rm -fv $(RPZ_GRAPH).dot
	reprounzip graph $(RPZ_GRAPH).dot

.dot.png:
	dot -Tpng $*.dot -o $*.png

png: $(PNGS)
