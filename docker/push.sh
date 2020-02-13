#!/usr/bin/env bash

# load settings from same directory as this script
SCRIPTDIR=`dirname $(readlink -f $0)`
source ${SCRIPTDIR}/settings.sh

docker push ${DOCKER_HUB_ORG}/${IMAGE_NAME}:${IMAGE_TAG}

