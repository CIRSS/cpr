IMAGE_ORG=tmcphillips
IMAGE_NAME=wt-prov-model
IMAGE_TAG=latest
TAGGED_IMAGE=${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

trace2facts:
	cd ./src/cmd/trace2facts && go install .

test:
	cd src && go test -v ./... | grep -v "\[no test files\]"

build-image:
	docker build -t ${TAGGED_IMAGE} .

push-image:
	docker push ${TAGGED_IMAGE}

pull-image:
	docker pull ${TAGGED_IMAGE}

run-image:
	docker run -it --volume $(CURDIR):/mnt/wt-prov-model ${TAGGED_IMAGE}

run-examples:
	. ~/.venv/reprozip/bin/activate
	$(MAKE) -C ./examples clean all

run-examples-image:
	docker run -it                                          \
		--volume $(CURDIR):/mnt/wt-prov-model               \
		${TAGGED_IMAGE}                                     \
		bash -ic 'make -C /mnt/wt-prov-model run-examples'

kill-all-containers:
	docker kill `docker ps -q` 2> /dev/null || :

stop-all-containers:
	docker stop `docker ps -a -q` 2> /dev/null || :

remove-all-containers:
	 docker rm `docker ps -aq` 2> /dev/null || :

remove-all-images:
	 docker rmi `docker images -aq` 2> /dev/null || :

purge-docker: kill-all-containers remove-all-containers remove-all-images

