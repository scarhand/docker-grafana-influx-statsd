#!/usr/bin/env bash
BASEDIR=$(dirname $(readlink -f $0))
CONTAINER_NAME=$(basename $BASEDIR)

$BASEDIR/stop.sh

docker run -d --name $CONTAINER_NAME \
    -v $BASEDIR/data:/data \
    -v $BASEDIR/aux:/aux \
    -p 3000:3000 \
    -p 8125:8125 \
    scarhand/$CONTAINER_NAME
