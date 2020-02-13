IMAGE_ORG=tmcphillips
IMAGE_NAME=wt-prov-model
IMAGE_TAG=latest

PWD=$(shell pwd)

build-image:
	docker build -t ${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG} .

push-image:
	docker push ${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

run-image:
	docker run -it --volume ${PWD}/examples:/mnt/examples ${IMAGE_ORG}/${IMAGE_NAME}:${IMAGE_TAG}
