#!/usr/bin/env bash
BASEDIR=$(dirname $(readlink -f $0))
CONTAINER_NAME=$(basename $BASEDIR)

docker exec -it $CONTAINER_NAME bash