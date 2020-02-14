IMAGE_ORG=tmcphillips
IMAGE_NAME=wt-prov-model
IMAGE_TAG=latest
IMAGE=${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

build-image:
	docker build -t ${IMAGE} .

push-image:
	docker push ${IMAGE}

run-image:
	docker run -it --volume $(CURDIR):/mnt/wt-prov-model ${IMAGE}

run-examples:
	. ~/.venv/reprozip/bin/activate
	$(MAKE) -C ./examples clean all

run-examples-image:
	docker run -it --volume $(CURDIR):/mnt/wt-prov-model ${IMAGE} bash -ic 'make -C /mnt/wt-prov-model run-examples'
