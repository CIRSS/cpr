RULES_DIR = ../common/rules
SCRIPTS_DIR = ../common/scripts

BIN_DIR=bin
RPZ_TRACE_DIR=.reprozip-trace
FACTS_DIR=facts
OUTPUTS_DIR=outputs
QUERIES_DIR=queries
GRAPHS_DIR=graphs
TEMP_DIR=temp

DIRS=$(BIN_DIR) $(OUTPUTS_DIR) $(RPZ_TRACE_DIR) $(FACTS_DIR) $(QUERIES_DIR) $(GRAPHS_DIR) $(TEMP_DIR)

RPZ_TRACE_SQLITE=$(RPZ_TRACE_DIR)/trace.sqlite3
RPZ_TRACE_YAML=$(RPZ_TRACE_DIR)/config.yml
RPZ_TRACE=$(RPZ_TRACE_SQLITE) $(RPZ_TRACE_YAML)

RPZ_FACTS=$(FACTS_DIR)/rpz_facts.pl
RPZ_VIEWS=$(FACTS_DIR)/rpz_views.pl

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

QUERY_RUN=$(QUERIES_DIR)/wt_run_queries.txt

ifdef QUERY_DIRECT_DEPENDENCIES_ARG
QUERY_DIRECT_DEPENDENCIES=$(QUERIES_DIR)/wt_direct_dependency_queries.txt
endif

#ifdef QUERY_OUTPUT_LINEAGES_ARG
#QUERY_OUTPUT_LINEAGES=$(QUERIES_DIR)/wt_output_lineage_queries.txt
#endif

WT_QUERIES=$(QUERY_RUN)               \
           $(QUERY_DIRECT_DEPENDENCIES) \
		   $(QUERY_OUTPUT_LINEAGES)

WT_GRAPH_RUN_INPUTS_OUTPUTS=$(GRAPHS_DIR)/wt_run_inputs_outputs
WT_GRAPH_PROCESS_AND_DATA_FILES=$(GRAPHS_DIR)/wt_processes_and_data_files

WT_GRAPHS=$(WT_GRAPH_RUN_INPUTS_OUTPUTS).dot		\
		  $(WT_GRAPH_PROCESS_AND_DATA_FILES).dot

FACTS=$(WT_FACTS) $(RPZ_FACTS)
VIEWS=$(RPZ_VIEWS)
QUERIES=$(WT_QUERIES) 
GRAPHS=$(WT_GRAPHS) $(RPZ_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

.dot.png:
	dot -Tpng $*.dot -o $*.png

all: fact view query png

clean:
	rm -rfv $(DIRS)

build: $(BIN_DIR)

run: $(OUTPUTS_DIR)
	./run.sh

trace: $(RPZ_TRACE)

fact: $(FACTS)

view: $(VIEWS)

query: $(QUERIES)

graph: $(GRAPHS)

png: $(PNGS)


$(DIRS):
	mkdir -p $@

$(RPZ_TRACE): build $(OUTPUTS_DIR) $(TEMP_DIR)
	reprozip trace --overwrite ./run.sh

$(FACTS): $(RPZ_TRACE) $(FACTS_DIR)
	trace2facts -i -n=$(shell basename $(CURDIR)) -rpz=$(RPZ_FACTS) -wt=$(WT_FACTS) -m $(RPZ_TRACE_DIR)

$(RPZ_VIEWS): $(WT_FACTS) $(RPZ_FACTS)
	bash $(SCRIPTS_DIR)/materialize_rpz_views.sh > $@

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

$(QUERY_RUN): $(QUERIES_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/query_run.sh > $@

$(QUERY_DIRECT_DEPENDENCIES): $(QUERIES_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/query_direct_dependencies.sh \
		$(QUERY_DIRECT_DEPENDENCIES_ARG) > $@

$(QUERY_OUTPUT_LINEAGES): $(QUERIES_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/query_output_lineages.sh > $@

$(WT_GRAPH_RUN_INPUTS_OUTPUTS).dot: $(FACTS) $(VIEWS) $(GRAPHS_DIR)
	bash $(SCRIPTS_DIR)/graph_run_inputs_outputs.sh > $@

$(WT_GRAPH_PROCESS_AND_DATA_FILES).dot: $(FACTS) $(VIEWS) $(GRAPHS_DIR)
	bash $(SCRIPTS_DIR)/graph_processes_and_data_files.sh > $@
