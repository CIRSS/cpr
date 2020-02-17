* Tim

	* ReproZip works fine in containers without extra capabilities.
	* The examples in the [wt-prov-model](https://github.com/tmcphillips/wt-prov-model) repo now can all be run via container on any computer with Docker and GNU Make installed:
		* Clone [wt-prov-model](https://github.com/tmcphillips/wt-prov-model).  The Makefile in the top-level directory runs Docker as needed by targets.
		* Type `make clean-examples`, then `git status` to confirm that the results were deleted.
		* Type `make run-examples`, then `git status` to see results  restored. (Mostly--there is some variation.)



