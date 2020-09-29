RULES_DIR = ../common/rules
SCRIPTS_DIR = ../common/scripts

BIN_DIR=bin
RPZ_TRACE_DIR=.reprozip-trace
FACTS_DIR=facts.d
OUTPUTS_DIR=outputs
QUERIES_DIR=queries.d
GRAPHS_DIR=graphs.d
PROV_DIR=prov.d
TEMP_DIR=temp

DIRS=$(BIN_DIR) $(OUTPUTS_DIR) provone $(RPZ_TRACE_DIR) $(FACTS_DIR) $(PROV_DIR) $(QUERIES_DIR) $(GRAPHS_DIR) $(TEMP_DIR)

RPZ_TRACE_SQLITE=$(RPZ_TRACE_DIR)/trace.sqlite3
RPZ_TRACE_YAML=$(RPZ_TRACE_DIR)/config.yml
RPZ_TRACE=$(RPZ_TRACE_SQLITE) $(RPZ_TRACE_YAML)

RPZ_FACTS=$(FACTS_DIR)/rpz_facts.pl
RPZ_VIEWS=$(FACTS_DIR)/rpz_views.pl

WT_FACTS=$(FACTS_DIR)/wt_facts.pl

QUERY_RUN=$(QUERIES_DIR)/wt_run_queries.txt

ifdef QUERY_DIRECT_DEPENDENCIES_ARG
QUERY_DIRECT_DEPENDENCIES=$(QUERIES_DIR)/wt_direct_dependency_queries.txt
endif

#ifdef QUERY_OUTPUT_LINEAGES_ARG
#QUERY_OUTPUT_LINEAGES=$(QUERIES_DIR)/wt_output_lineage_queries.txt
#endif

WT_QUERIES=$(QUERY_RUN)                 \
           $(QUERY_DIRECT_DEPENDENCIES) \
           $(QUERY_OUTPUT_LINEAGES)

WT_GRAPH_RUN_INPUTS_OUTPUTS=$(GRAPHS_DIR)/wt_run_inputs_outputs
WT_GRAPH_PROCESS_AND_DATA_FILES=$(GRAPHS_DIR)/wt_processes_and_data_files

WT_GRAPHS=$(WT_GRAPH_RUN_INPUTS_OUTPUTS).dot		\
          $(WT_GRAPH_PROCESS_AND_DATA_FILES).dot

PROV_RUN_JSON=$(PROV_DIR)/prov_run.json
PROVONE_RUN_JSON=$(PROV_DIR)/provone_run.json
PROV=$(PROV_RUN_JSON) $(PROVONE_RUN_JSON)

FACTS=$(WT_FACTS) $(RPZ_FACTS)
VIEWS=$(RPZ_VIEWS)
QUERIES=$(WT_QUERIES) 
GRAPHS=$(WT_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

.dot.png:
	dot -Tpng $*.dot -o $*.png

all: fact view query prov png

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

prov: $(PROV)

png: $(PNGS)


$(DIRS):
	mkdir -p $@

$(RPZ_TRACE): build $(OUTPUTS_DIR) $(TEMP_DIR)
	reprozip trace --overwrite ./run.sh

$(FACTS): $(RPZ_TRACE) $(FACTS_DIR)
	rpz2cpr -i -n=$(shell basename $(CURDIR)) -rpz=$(RPZ_FACTS) -wt=$(WT_FACTS) -m $(RPZ_TRACE_DIR)

$(RPZ_VIEWS): $(WT_FACTS) $(RPZ_FACTS)
	bash $(SCRIPTS_DIR)/materialize_rpz_views.sh > $@

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

$(PROV_RUN_JSON): $(PROV_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/prov_run_json.sh | jq "." > $@

$(PROVONE_RUN_JSON): $(PROV_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/provone_run_json.sh | jq "." > $@

