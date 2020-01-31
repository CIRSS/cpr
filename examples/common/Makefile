
RPZ_RUN_AND_IO_FILES=graphs/rpz_A_run_with_input_and_output_files
RPZ_IO_FILES=graphs/rpz_B_run_processes_with_input_and_output_files
RPZ_NO_PACKAGES=graphs/rpz_C_run_processes_with_nonpackage_files
RPZ_PACKAGES=graphs/rpz_D_run_processes_with_nonpackage_files_and_packages
RPZ_PACKAGE_CONTENTS=graphs/rpz_E_run_processes_with_all_files_and_packages

RPZ_GRAPHS=$(RPZ_RUN_AND_IO_FILES).dot	\
           $(RPZ_IO_FILES).dot			\
		   $(RPZ_NO_PACKAGES).dot		\
		   $(RPZ_PACKAGES).dot			\
		   $(RPZ_PACKAGE_CONTENTS).dot

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

$(RPZ_RUN_AND_IO_FILES).dot:
	rm -fv $@
	reprounzip graph --processes run --packages drop --otherfiles io $@

$(RPZ_IO_FILES).dot:
	rm -fv $@
	reprounzip graph --processes process --packages drop --otherfiles io $@

$(RPZ_NO_PACKAGES).dot:
	rm -fv $@
	reprounzip graph --processes process --packages drop $@

$(RPZ_PACKAGES).dot:
	rm -fv $@
	reprounzip graph --packages package --processes process $@

$(RPZ_PACKAGE_CONTENTS).dot:
	rm -fv $@
	reprounzip graph --processes process $@



.dot.png:
	dot -Tpng $*.dot -o $*.png

png: $(PNGS)
