BIN_DIR=bin
FACTS_DIR=facts
OUTPUTS_DIR=outputs
GRAPHS_DIR=graphs

DIRS=$(BIN_DIR) $(FACTS_DIR) $(OUTPUTS_DIR) $(GRAPHS_DIR)

RPZ_RUN_IO_FILES=$(GRAPHS_DIR)/rpz_A_run_with_input_and_output_files
RPZ_PROCESSES_IO_FILES=$(GRAPHS_DIR)/rpz_B_processes_with_input_and_output_files
RPZ_PROCESSES_NONPACKAGE_FILES=$(GRAPHS_DIR)/rpz_C_processes_with_nonpackage_files
RPZ_PROCESSES_NONPACKAGE_FILES_PACKAGES=$(GRAPHS_DIR)/rpz_D_processes_with_nonpackage_files_and_packages
RPZ_PROCESSES_FILES_PACKAGES=$(GRAPHS_DIR)/rpz_E_processes_with_all_files_and_packages

RPZ_GRAPHS=$(RPZ_RUN_IO_FILES).dot							\
           $(RPZ_PROCESSES_IO_FILES).dot					\
		   $(RPZ_PROCESSES_NONPACKAGE_FILES).dot			\
		   $(RPZ_PROCESSES_NONPACKAGE_FILES_PACKAGES).dot	\
		   $(RPZ_PROCESSES_FILES_PACKAGES).dot

GRAPHS=$(RPZ_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

all:  build record extract png

clean:
	rm -rfv $(DIRS) .reprozip-trace

$(DIRS):
	mkdir -p $@

build: $(BIN_DIR)

run: $(OUTPUTS_DIR)
	./run.sh

record: build $(OUTPUTS_DIR)
	reprozip trace --overwrite ./run.sh

extract: $(FACTS_DIR)
	rpz2prolog -m -i .reprozip-trace > $(FACTS_DIR)/rpz_facts.pl

graph: $(GRAPHS)

$(RPZ_RUN_IO_FILES).dot: $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes run --packages drop --otherfiles io $@

$(RPZ_PROCESSES_IO_FILES).dot:  $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes process --packages drop --otherfiles io $@

$(RPZ_PROCESSES_NONPACKAGE_FILES).dot: $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes process --packages drop $@

$(RPZ_PROCESSES_NONPACKAGE_FILES_PACKAGES).dot: $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --packages package --processes process $@

$(RPZ_PROCESSES_FILES_PACKAGES).dot: $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes process $@

.dot.png:
	dot -Tpng $*.dot -o $*.png

png: $(PNGS)
