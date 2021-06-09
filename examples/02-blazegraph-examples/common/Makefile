RUN_SCRIPT_FILE=./workspace/run.sh
CPR_REPORT_DIR=./reports
REPROZIP_TRACE_DIR=.reprozip-trace

EXAMPLE_SCRATCH_DIR=./.scratch

DIRS=${CPR_REPORT_DIR} ${EXAMPLE_SCRATCH_DIR} ${REPROZIP_TRACE_DIR}

all: run

$(DIRS):
	mkdir -p $@

clean:
	rm -rfv ${DIRS}

run: $(DIRS)
	reprozip trace --overwrite ${RUN_SCRIPT_FILE} > .scratch/reprozip-trace.txt
	

