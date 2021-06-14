CPR_OUTPUTS_DIR=./cpr
CPR_SCRATCH_DIR=${CPR_OUTPUTS_DIR}/.scratch

RUN_WORKSPACE_DIR=./workspace
RUN_SCRIPT_FILE=${RUN_WORKSPACE_DIR}/run.sh
RUN_OUTPUT_FILE=${CPR_OUTPUTS_DIR}/run.txt

BIN_DIR=${RUN_WORKSPACE_DIR}/bin

REPROZIP_TRACE_DIR=.reprozip-trace
REPROZIP_LOG_FILE=${CPR_SCRATCH_DIR}/reprozip-trace-log.txt

REPORT_SCRIPT_FILE=../common/report.sh
REPORT_OUTPUT_FILE=${CPR_OUTPUTS_DIR}/report.txt

TRACE_DIRS=${CPR_REPORT_DIR}  	\
	 ${CPR_OUTPUTS_DIR}		\
	 ${CPR_SCRATCH_DIR} 	\
	 ${REPROZIP_TRACE_DIR}

all: run

$(TRACE_DIRS):
	mkdir -p $@

clean:
	rm -rfv ${BIN_DIR} ${TRACE_DIRS}

build:

run: trace report

rerun: clean run

trace: $(TRACE_DIRS)
	reprozip -v trace --overwrite ${RUN_SCRIPT_FILE} 	\
		1> ${RUN_OUTPUT_FILE} 							\
		2> ${REPROZIP_LOG_FILE} 

report:
	bash ${REPORT_SCRIPT_FILE} > ${REPORT_OUTPUT_FILE}

