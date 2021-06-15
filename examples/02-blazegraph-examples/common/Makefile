
EXAMPLE_DIR=$(shell pwd)
WORKSPACE_DIR=${EXAMPLE_DIR}/workspace
WORKSPACE_BIN_DIR=${WORKSPACE_DIR}/bin
RUN_DIR=${EXAMPLE_DIR}/run
REPROZIP_TRACE_DIR=${RUN_DIR}/.reprozip-trace
SCRATCH_DIR=${RUN_DIR}/.scratch

RUN_SCRIPT_FILE=${WORKSPACE_DIR}/run.sh
REPROZIP_STDOUT_FILE=${SCRATCH_DIR}/reprozip_stdout.txt
REPROZIP_STDERR_FILE=${SCRATCH_DIR}/reprozip_stderr.txt
REPORTS_RUN_SCRIPT=../common/run_reports.sh
REPORTS_RUN_SUMMARY=${RUN_DIR}/reports_summary.txt

DIRS=${WORKSPACE_BIN_DIR}	\
	 ${RUN_DIR}  			\
 	 ${SCRATCH_DIR}

all: build run

run:  init trace report

$(DIRS):
	mkdir -p $@

init-workspace:

init: init-workspace ${RUN_DIR} ${SCRATCH_DIR} 

clean-workspace:

clean: clean-workspace
	rm -rfv ${WORKSPACE_BIN_DIR}	\
			${RUN_DIR}

build-code:

build: ${WORKSPACE_BIN_DIR} build-code

rerun: clean run

trace:
	cd ${WORKSPACE_DIR}															&&	\
	reprozip -v trace --overwrite -d ${REPROZIP_TRACE_DIR}	${RUN_SCRIPT_FILE} 		\
		1> ${REPROZIP_STDOUT_FILE} 													\
		2> ${REPROZIP_STDERR_FILE} 

report: ${RUN_DIR}
	bash ${REPORTS_RUN_SCRIPT} > ${REPORTS_RUN_SUMMARY}

