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


ifeq ('$(OS)', 'Windows_NT')
ifndef PWSH_COMMAND
PWSH_COMMAND=powershell
endif
PWSH=$(PWSH_COMMAND) -noprofile -command
endif

stop-all-containers:
ifdef PWSH
	${PWSH} 'docker ps -q | % { docker stop $$_ }'
else
	for c in $$(docker ps -q); do docker stop $$c; done
endif

kill-all-containers:
ifdef PWSH
	${PWSH} 'docker ps -q | % { docker kill $$_ }'
else
	for c in $$(docker ps -q); do docker kill $$c; done
endif

remove-all-containers:
ifdef PWSH
	${PWSH} 'docker ps -aq | % { docker rm $$_ }'
else
	for c in $$(docker ps -aq); do docker rm $$c; done
endif

remove-all-images:
ifdef PWSH
	${PWSH} 'docker images -aq | % { docker rmi $$_ }'
else
	for i in $$(docker images -aq); do docker rmi $$i; done
endif

purge-docker: stop-all-containers kill-all-containers remove-all-containers remove-all-images
