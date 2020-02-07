RULES_DIR = ../common/rules
SCRIPTS_DIR = ../common/scripts

BIN_DIR=bin
RPZ_TRACE_DIR=.reprozip-trace
FACTS_DIR=facts
VIEWS_DIR=views
OUTPUTS_DIR=outputs
GRAPHS_DIR=graphs
TEMP_DIR=temp

DIRS=$(BIN_DIR) $(OUTPUTS_DIR) $(RPZ_TRACE_DIR) $(FACTS_DIR) $(VIEWS_DIR) $(GRAPHS_DIR) $(TEMP_DIR)

RPZ_TRACE_SQLITE=$(RPZ_TRACE_DIR)/trace.sqlite3
RPZ_TRACE_YAML=$(RPZ_TRACE_DIR)/config.yml
RPZ_TRACE=$(RPZ_TRACE_SQLITE) $(RPZ_TRACE_YAML)

RPZ_FACTS=$(FACTS_DIR)/rpz_facts.pl
RPZ_VIEWS=$(VIEWS_DIR)/rpz_views.pl

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

WT_FACTS=$(FACTS_DIR)/wt_facts.pl

WT_GRAPH_RUN_INPUTS_OUTPUTS=$(GRAPHS_DIR)/wt_run_inputs_outputs
WT_GRAPH_PROCESS_AND_DATA_FILES=$(GRAPHS_DIR)/wt_processes_and_data_files

WT_GRAPHS=$(WT_GRAPH_RUN_INPUTS_OUTPUTS).dot		\
		  $(WT_GRAPH_PROCESS_AND_DATA_FILES).dot

FACTS=$(RPZ_FACTS) $(WT_FACTS)
VIEWS=$(RPZ_VIEWS)
GRAPHS=$(RPZ_GRAPHS) $(WT_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

.dot.png:
	dot -Tpng $*.dot -o $*.png


all: fact view png

clean:
	rm -rfv $(DIRS)

build: $(BIN_DIR)

run: $(OUTPUTS_DIR)
	./run.sh

trace: $(RPZ_TRACE)

fact: $(FACTS)

view: $(VIEWS)

graph: $(GRAPHS)

png: $(PNGS)


$(DIRS):
	mkdir -p $@

$(RPZ_TRACE): build $(OUTPUTS_DIR) $(TEMP_DIR)
	reprozip trace --overwrite ./run.sh

$(FACTS): $(RPZ_TRACE) $(FACTS_DIR)
	trace2facts -i -n=$(shell basename $(CURDIR)) -rpz=$(RPZ_FACTS) -wt=$(WT_FACTS) -m $(RPZ_TRACE_DIR)

$(RPZ_VIEWS): $(RPZ_FACTS) $(VIEWS_DIR)
	bash $(SCRIPTS_DIR)/materialize_rpz_views.sh > $(RPZ_VIEWS)

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

$(WT_GRAPH_RUN_INPUTS_OUTPUTS).dot: $(FACTS) $(VIEWS) $(GRAPHS_DIR)
	bash $(SCRIPTS_DIR)/graph_run_inputs_outputs.sh > $@

$(WT_GRAPH_PROCESS_AND_DATA_FILES).dot: $(FACTS) $(VIEWS) $(GRAPHS_DIR)
	bash $(SCRIPTS_DIR)/graph_processes_and_data_files.sh > $@
