#!/bin/sh
apk update 
apk add --no-cache openssl openrc git rsync \
mkdir -p /run/openrc \
touch /run/openrc/softlevel 
openrc default 
openrc default 
rc-update

apk add libc6-compat

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_amd64.tar.gz
tar xf telegraf-1.18.2_linux_amd64.tar.gz
