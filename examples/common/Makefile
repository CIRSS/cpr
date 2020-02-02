BIN_DIR=bin
RPZ_TRACE_DIR=.reprozip-trace
FACTS_DIR=facts
OUTPUTS_DIR=outputs
GRAPHS_DIR=graphs

DIRS=$(BIN_DIR) $(RPZ_TRACE_DIR) $(FACTS_DIR) $(OUTPUTS_DIR) $(GRAPHS_DIR)

RPZ_TRACE_SQLITE=$(RPZ_TRACE_DIR)/trace.sqlite3
RPZ_TRACE_YAML=$(RPZ_TRACE_DIR)/config.yml
RPZ_TRACE=$(RPZ_TRACE_SQLITE) $(RPZ_TRACE_YAML)

RPZ_FACTS=$(FACTS_DIR)/rpz_facts.pl

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

FACTS=$(RPZ_FACTS)
GRAPHS=$(RPZ_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)


.SUFFIXES:
.SUFFIXES: .dot .pdf .png

.dot.png:
	dot -Tpng $*.dot -o $*.png


all: fact png

clean:
	rm -rfv $(DIRS)

build: $(BIN_DIR)

run: $(OUTPUTS_DIR)
	./run.sh

trace: $(RPZ_TRACE)

fact: $(FACTS)

graph: $(GRAPHS)

png: $(PNGS)


$(DIRS):
	mkdir -p $@

$(RPZ_TRACE): build $(OUTPUTS_DIR)
	reprozip trace --overwrite ./run.sh

$(RPZ_FACTS): $(RPZ_TRACE) $(FACTS_DIR)
	rpz2prolog -m -i $(RPZ_TRACE_DIR) > $(RPZ_FACTS)

$(RPZ_RUN_IO_FILES).dot: $(RPZ_TRACE) $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes run --packages drop --otherfiles io $@

$(RPZ_PROCESSES_IO_FILES).dot: $(RPZ_TRACE) $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes process --packages drop --otherfiles io $@

$(RPZ_PROCESSES_NONPACKAGE_FILES).dot: $(RPZ_TRACE) $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes process --packages drop $@

$(RPZ_PROCESSES_NONPACKAGE_FILES_PACKAGES).dot: $(RPZ_TRACE) $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --packages package --processes process $@

$(RPZ_PROCESSES_FILES_PACKAGES).dot: $(RPZ_TRACE) $(GRAPHS_DIR)
	rm -fv $@
	reprounzip graph --processes process $@

