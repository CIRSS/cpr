RULES_DIR = ../common/rules
SCRIPTS_DIR = ../common/scripts

BIN_DIR=bin
RPZ_TRACE_DIR=.reprozip-trace
FACTS_DIR=facts.d
TRIPLES_DIR=triples.d
OUTPUTS_DIR=outputs
QUERIES_DIR=queries.d
GRAPHS_DIR=graphs.d
PROV_DIR=prov.d
TEMP_DIR=temp

DIRS=$(BIN_DIR) $(OUTPUTS_DIR) provone $(RPZ_TRACE_DIR) $(FACTS_DIR) $(TRIPLES_DIR) $(PROV_DIR) $(QUERIES_DIR) $(GRAPHS_DIR) $(TEMP_DIR)

RPZ_TRACE_SQLITE=$(RPZ_TRACE_DIR)/trace.sqlite3
RPZ_TRACE_YAML=$(RPZ_TRACE_DIR)/config.yml
RPZ_TRACE=$(RPZ_TRACE_SQLITE) $(RPZ_TRACE_YAML)

TRACE_FACTS=$(FACTS_DIR)/trace_facts.pl
TRACE_VIEWS=$(FACTS_DIR)/trace_views.pl

TURTLE_FILE=${TRIPLES_DIR}/trace.ttl
TRIPLES=$(TURTLE_FILE)

QUERY_RUN=$(QUERIES_DIR)/cpr_run_queries.txt

ifdef QUERY_DIRECT_DEPENDENCIES_ARG
QUERY_DIRECT_DEPENDENCIES=$(QUERIES_DIR)/cpr_direct_dependency_queries.txt
endif

#ifdef QUERY_OUTPUT_LINEAGES_ARG
#QUERY_OUTPUT_LINEAGES=$(QUERIES_DIR)/cpr_output_lineage_queries.txt
#endif

CPR_QUERIES=$(QUERY_RUN)                 \
           $(QUERY_DIRECT_DEPENDENCIES) \
           $(QUERY_OUTPUT_LINEAGES)

CPR_GRAPH_RUN_INPUTS_OUTPUTS=$(GRAPHS_DIR)/cpr_run_inputs_outputs
CPR_GRAPH_PROCESS_AND_DATA_FILES=$(GRAPHS_DIR)/cpr_processes_and_data_files

CPR_GRAPHS=$(CPR_GRAPH_RUN_INPUTS_OUTPUTS).dot		\
          $(CPR_GRAPH_PROCESS_AND_DATA_FILES).dot

PROV_RUN_JSON=$(PROV_DIR)/prov_run.json
PROVONE_RUN_JSON=$(PROV_DIR)/provone_run.json
PROV=$(PROV_RUN_JSON) $(PROVONE_RUN_JSON)

RUN_NAME=$(shell basename $(CURDIR))

FACTS=$(TRACE_FACTS)
VIEWS=$(TRACE_VIEWS)
QUERIES=$(CPR_QUERIES) 
GRAPHS=$(CPR_GRAPHS)
PNGS = $(GRAPHS:.dot=.png)

.SUFFIXES:
.SUFFIXES: .dot .pdf .png

.dot.png:
	dot -Tpng $*.dot -o $*.png

all: fact view triples query prov png

clean:
	rm -rfv $(DIRS)

build: $(BIN_DIR)

run: $(OUTPUTS_DIR)
	./run.sh

trace: $(RPZ_TRACE)

fact: $(FACTS)

triples: ${TRIPLES}

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
	cpr convert -noroot -notimestamps -name=$(RUN_NAME) -from reprozip -to facts -src $(RPZ_TRACE_DIR) -dest $(TRACE_FACTS)

$(TRIPLES): $(RPZ_TRACE) $(TRIPLES_DIR)
	cpr convert -noroot -notimestamps -name=$(RUN_NAME) -from reprozip -to triples -src $(RPZ_TRACE_DIR) -dest $(TURTLE_FILE)

$(TRACE_VIEWS): $(TRACE_FACTS)
	bash $(SCRIPTS_DIR)/materialize_cpr_views.sh > $@

$(QUERY_RUN): $(QUERIES_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/query_run.sh > $@

$(QUERY_DIRECT_DEPENDENCIES): $(QUERIES_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/query_direct_dependencies.sh \
		$(QUERY_DIRECT_DEPENDENCIES_ARG) > $@

$(QUERY_OUTPUT_LINEAGES): $(QUERIES_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/query_output_lineages.sh > $@

$(CPR_GRAPH_RUN_INPUTS_OUTPUTS).dot: $(FACTS) $(VIEWS) $(GRAPHS_DIR)
	bash $(SCRIPTS_DIR)/graph_run_inputs_outputs.sh > $@

$(CPR_GRAPH_PROCESS_AND_DATA_FILES).dot: $(FACTS) $(VIEWS) $(GRAPHS_DIR)
	bash $(SCRIPTS_DIR)/graph_processes_and_data_files.sh > $@

$(PROV_RUN_JSON): $(PROV_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/prov_run_json.sh | jq "." > $@

$(PROVONE_RUN_JSON): $(PROV_DIR) $(VIEWS)
	bash $(SCRIPTS_DIR)/provone_run_json.sh | jq "." > $@

