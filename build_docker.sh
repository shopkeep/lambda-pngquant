#!/bin/bash
set -eou pipefail

DOCKER_CONTAINER_NAME=pngquant-builder
DOCKER_IMAGE_NAME=pngquant-builder

# make sure the container doesn't exist before going any further
set +e
docker rm -f $DOCKER_CONTAINER_NAME &> /dev/null
set -e

# build pngquant inside Docker
docker build -t $DOCKER_IMAGE_NAME .
docker run -ti --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME

# copy the completed binary out of the build container
mkdir -p artifacts && cd artifacts
docker cp $DOCKER_CONTAINER_NAME:/var/task/pngquant/pngquant.gz pngquant.gz
