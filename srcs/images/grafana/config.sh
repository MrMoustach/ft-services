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