#!/bin/sh
apk update 
apk add --no-cache openssl openrc git rsync\
mkdir -p /run/openrc \
touch /run/openrc/softlevel 
openrc default 
rc-update

apk add libc6-compat

wget https://dl.grafana.com/oss/release/grafana-7.5.6.linux-amd64.tar.gz
tar -zxvf grafana-7.5.6.linux-amd64.tar.gz
mkdir -p grafana-7.5.6/data
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_amd64.tar.gz
tar xf telegraf-1.18.2_linux_amd64.tar.gz