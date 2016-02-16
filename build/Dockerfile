FROM ubuntu:15.10

ENV DEBIAN_FRONTEND noninteractive

# install required packages and nodejs
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git curl wget ca-certificates apt-transport-https supervisor netcat \
    adduser libfontconfig && \
    curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

# install statsd
RUN git clone https://github.com/etsy/statsd.git /src/statsd && \
    cd /src/statsd && \
    git checkout v0.7.2 && \
    npm install statsd-influxdb-backend

# install grafana
RUN     mkdir /src/grafana && \
        mkdir /opt/grafana && \
        wget https://grafanarel.s3.amazonaws.com/builds/grafana-2.1.3.linux-x64.tar.gz -O /src/grafana.tar.gz && \
        tar -xzf /src/grafana.tar.gz -C /opt/grafana --strip-components=1 && \
        rm /src/grafana.tar.gz

# install influx
RUN wget https://s3.amazonaws.com/influxdb/influxdb_0.9.6_amd64.deb && \
    dpkg -i influxdb_0.9.6_amd64.deb && \
    rm influxdb_0.9.6_amd64.deb

# Configure influx
ADD influxdb.conf /etc/influxdb/influxdb.conf

# Confiure StatsD
ADD statsd-config.js /src/statsd/config.js

# Configure Grafana
ADD grafana.ini /opt/grafana/conf/custom.ini

# Configure supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


ENTRYPOINT ["/aux/init.sh"]