#!/bin/bash

mkdir -p /data/grafana
mkdir -p /data/influx

exec /usr/bin/supervisord