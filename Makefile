IMAGE_ORG=tmcphillips
IMAGE_NAME=wt-prov-model
IMAGE_TAG=latest
TAGGED_IMAGE=${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

run-examples:
	docker run -it                                                          \
		--volume $(CURDIR):/mnt/wt-prov-model                               \
		${TAGGED_IMAGE}                                                     \
		bash -ic 'make -C /mnt/wt-prov-model/examples all'

clean-examples:
	docker run -it                                                          \
		--volume $(CURDIR):/mnt/wt-prov-model                               \
		${TAGGED_IMAGE}                                                     \
		bash -ic 'make -C /mnt/wt-prov-model/examples clean'

start:
	docker run -it --volume $(CURDIR):/mnt/wt-prov-model ${TAGGED_IMAGE}

install-code:
	$(MAKE) -C ./src install

test-code:
	$(MAKE) -C ./src test

build-image:
	docker build -t ${TAGGED_IMAGE} .

push-image:
	docker push ${TAGGED_IMAGE}

pull-image:
	docker pull ${TAGGED_IMAGE}

kill-all-containers:
	docker kill `docker ps -q` ; :

stop-all-containers:
	docker stop `docker ps -a -q` ; :

remove-all-containers:
	 docker rm `docker ps -aq` ; :

remove-all-images:
	 docker rmi `docker images -aq` ; :

purge-docker: kill-all-containers remove-all-containers remove-all-images

