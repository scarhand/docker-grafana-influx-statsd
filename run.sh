#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))
CONTAINER_NAME=$(basename $BASEDIR)

$BASEDIR/stop.sh

docker run -d --name $CONTAINER_NAME \
    -v $BASEDIR/data:/data \
    -v $BASEDIR/aux:/aux \
    scarhand/$CONTAINER_NAME
