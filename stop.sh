#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))
CONTAINER_NAME=$(basename $BASEDIR)

set -e

if docker inspect $CONTAINER_NAME 2> /dev/null | grep --quiet 'IPAddress' ; then
	if docker inspect $CONTAINER_NAME | grep 'IPAddress' | grep -E --quiet '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' ; then
		echo "Stopping $CONTAINER_NAME"
		docker stop $CONTAINER_NAME > /dev/null
	else
		echo "$CONTAINER_NAME is not running"
	fi
	echo "Removing old $CONTAINER_NAME"
	docker rm $CONTAINER_NAME > /dev/null
else
	echo "$CONTAINER_NAME does not exist"
fi
