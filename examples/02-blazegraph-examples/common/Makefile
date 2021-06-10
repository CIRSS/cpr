SCRATCH_DIR=./.scratch

RUN_WORKSPACE_DIR=./workspace
RUN_SCRIPT_FILE=${RUN_WORKSPACE_DIR}/run.sh
RUN_OUTPUT_FILE=${SCRATCH_DIR}/run.txt

REPROZIP_TRACE_DIR=.reprozip-trace
REPROZIP_LOG_FILE=${SCRATCH_DIR}/reprozip-trace-log.txt

REPORT_OUTPUT_DIR=./reports
REPORT_SCRIPT_FILE=../common/run_report.sh
REPORT_OUTPUT_FILE=${REPORT_OUTPUT_DIR}/report.txt

DIRS=${CPR_REPORT_DIR}  	\
	 ${SCRATCH_DIR} 		\
	 ${REPROZIP_TRACE_DIR}	\
	 ${REPORT_OUTPUT_DIR}

all: run

$(DIRS):
	mkdir -p $@

clean:
	rm -rfv ${DIRS}

run: trace report

rerun: clean run

trace: $(DIRS)
	reprozip -v trace --overwrite ${RUN_SCRIPT_FILE} 	\
		1> ${RUN_OUTPUT_FILE} 							\
		2> ${REPROZIP_LOG_FILE} 

report:
	bash ${REPORT_SCRIPT_FILE} > ${REPORT_OUTPUT_FILE}

