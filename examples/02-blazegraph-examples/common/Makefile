CPR_DIR=./cpr
SCRATCH_DIR=${CPR_DIR}/.scratch

WORKSPACE_DIR=./workspace
WORKSPACE_BIN_DIR=${WORKSPACE_DIR}/bin

RUN_SCRIPT_FILE=${WORKSPACE_DIR}/run.sh

REPROZIP_TRACE_DIR=${CPR_DIR}/.reprozip-trace
REPROZIP_STDOUT_FILE=${SCRATCH_DIR}/reprozip_stdout.txt
REPROZIP_STDERR_FILE=${SCRATCH_DIR}/reprozip_stderr.txt

REPORTS_RUN_SCRIPT=../common/run_reports.sh
REPORTS_RUN_SUMMARY=${CPR_DIR}/reports_summary.txt

DIRS=${WORKSPACE_BIN_DIR}	\
	 ${CPR_DIR}  			\
 	 ${SCRATCH_DIR}

all: build run

run: ${SCRATCH_DIR} trace report

$(DIRS):
	mkdir -p $@

clean:
	rm -rfv ${WORKSPACE_BIN_DIR}	\
			${CPR_DIR}

build-code:

build: ${WORKSPACE_BIN_DIR} build-code

rerun: clean run

trace: $(TRACE_DIRS)
	reprozip -v trace --overwrite -d ${REPROZIP_TRACE_DIR}	${RUN_SCRIPT_FILE} 	\
		1> ${REPROZIP_STDOUT_FILE} 												\
		2> ${REPROZIP_STDERR_FILE} 

report: ${CPR_DIR}
	bash ${REPORTS_RUN_SCRIPT} > ${REPORTS_RUN_SUMMARY}

