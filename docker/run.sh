#!/usr/bin/env bash

# load settings from same directory as this script
SCRIPTDIR=`dirname $(readlink -f $0)`
source ${SCRIPTDIR}/settings.sh

# run the Docker image mounting the current directory in the container
cd examples
docker run -it --volume $(pwd):/mnt/examples ${DOCKER_HUB_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

