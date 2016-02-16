#!/bin/bash

# create the database in influx
while ! nc -zv -w 5 localhost 8086 2>&1 | grep -q open; do
	printf "."
	sleep 5
done
curl http://localhost:8086/query?q=CREATE+DATABASE+data