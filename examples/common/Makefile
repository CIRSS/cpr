
GRAPHS = $(RPZ_GRAPH).dot

RPZ_COMPLETE=graphs/rpz_complete
RPZ_NO_PACKAGES=graphs/rpz_no_packages
RPZ_IO_FILES=graphs/rpz_io_files

RPZ_GRAPHS=$(RPZ_COMPLETE).dot 		\
           $(RPZ_NO_PACKAGES).dot	\
		   $(RPZ_IO_FILES).dot

GRAPHS=$(RPZ_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

all:  build record extract png

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
	rpz2prolog -m -i .reprozip-trace > facts/rpz_facts.pl

graph: $(GRAPHS)

$(RPZ_COMPLETE).dot:
	rm -fv $@
	reprounzip graph --processes process $@

$(RPZ_NO_PACKAGES).dot:
	rm -fv $@
	reprounzip graph --processes process --packages drop $@

$(RPZ_IO_FILES).dot:
	rm -fv $@
	reprounzip graph --processes process --packages drop --otherfiles io $@


.dot.png:
	dot -Tpng $*.dot -o $*.png

png: $(PNGS)
