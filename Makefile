IMAGE_ORG=tmcphillips
IMAGE_NAME=wt-prov-model
IMAGE_TAG=latest
TAGGED_IMAGE=${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

ADD_CAPS=SYS_PTRACE
REPO_DIR=/mnt/wt-prov-model
RUN_IMAGE=docker run -it                             \
                     --volume $(CURDIR):$(REPO_DIR)  \
                     --cap-add=$(ADD_CAPS)           \
                     $(TAGGED_IMAGE)

ifdef IN_RUNNING_RIPPO
RUN_IN_IMAGE=bash -ic
else
RUN_IN_IMAGE=$(RUN_IMAGE) bash -ic
endif

# These targets work both outside and inside a running RIPPO

run-examples:
	$(RUN_IN_IMAGE) 'make -C $(REPO_DIR)/examples all'

clean-examples:
	$(RUN_IN_IMAGE) 'make -C $(REPO_DIR)/examples clean'

install-code:
	$(RUN_IN_IMAGE) 'make -C $(REPO_DIR)/src install'

test-code:
	$(RUN_IN_IMAGE) 'make -C $(REPO_DIR)/src test'


# The remaining targets are defined only outside a running RIPPO

ifndef IN_RUNNING_RIPPO

start:
	$(RUN_IMAGE)

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

endif
