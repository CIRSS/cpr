ifeq ('$(OS)', 'Windows_NT')
PWSH=powershell -noprofile -command
endif

IMAGE_ORG=tmcphillips
IMAGE_NAME=wt-prov-model
IMAGE_TAG=latest
TAGGED_IMAGE=${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

ADD_CAPS=SYS_PTRACE
REPRO_DIR=/mnt/wt-prov-model
RUN_REPRO=docker run -it                              \
                     --volume $(CURDIR):$(REPRO_DIR)  \
                     --cap-add=$(ADD_CAPS)            \
                     $(TAGGED_IMAGE)

ifdef IN_RUNNING_REPRO
RUN_IN_REPRO=bash -ic
else
RUN_IN_REPRO=$(RUN_REPRO) bash -ic
endif

## 
## ------------------------------------------------------------------------------
##        Make targets available both INSIDE and OUTSIDE a running REPRO
## 

help:                   ## Show this help.
ifdef PWSH
	@${PWSH} "Select-String -Path $(MAKEFILE_LIST) -Pattern '#\# ' | % {$$_.Line.replace('##','')}"
else
	@sed -ne '/@sed/!s/#\# //p' $(MAKEFILE_LIST)
endif

run: run-examples       ## Alias for run-examples.
run-examples:           ## Run all of the examples.
	$(RUN_IN_REPRO) 'make -C $(REPRO_DIR)/examples all'

clean: clean-examples   ## Alias for clean-examples.
clean-examples:         ## Delete all products of examples.
	$(RUN_IN_REPRO) 'make -C $(REPRO_DIR)/examples clean'

build-code:             ## Build and install custom code.
	$(RUN_IN_REPRO) 'make -C $(REPRO_DIR)/src install'

test-code:              ## Run tests on custom code.
	$(RUN_IN_REPRO) 'make -C $(REPRO_DIR)/src test'


## ------------------------------------------------------------------------------
##            Make targets available only OUTSIDE a running REPRO
## 

ifndef IN_RUNNING_REPRO

start:                  ## Start a bash session in a new Docker container.
	$(RUN_REPRO)

image:                  ## Alias for build-image.
build-image:            ## Build the Docker image used to run this REPRO.
	docker build -t ${TAGGED_IMAGE} .

pull-image:             ## Pull the Docker image from Docker Hub.
	docker pull ${TAGGED_IMAGE}

push-image:             ## Push the Docker image to Docker Hub.
	docker push ${TAGGED_IMAGE}

## 

stop-all-containers:    ## Gently stop all running Docker containers.
ifdef PWSH
	${PWSH} 'docker ps -q | % { docker stop $$_ }'
else
	for c in $$(docker ps -q); do docker stop $$c; done
endif

kill-all-containers:    ## Forcibly stop all running Docker containers.
ifdef PWSH
	${PWSH} 'docker ps -q | % { docker kill $$_ }'
else
	for c in $$(docker ps -q); do docker kill $$c; done
endif

remove-all-containers:  ## Delete all stopped Docker containers.
ifdef PWSH
	${PWSH} 'docker ps -aq | % { docker rm $$_ }'
else
	for c in $$(docker ps -aq); do docker rm $$c; done
endif

remove-all-images:      ## Delete all Docker images on this computer.
ifdef PWSH
	${PWSH} 'docker images -aq | % { docker rmi $$_ }'
else
	for i in $$(docker images -aq); do docker rmi $$i; done
endif

purge-docker:           ## Purge all Docker containers and images from computer.
purge-docker: stop-all-containers kill-all-containers remove-all-containers remove-all-images

endif

## ------------------------------------------------------------------------------
## 
