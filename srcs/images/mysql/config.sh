#!/bin/sh
apk --no-cache add mariadb mariadb-common mariadb-client
apk update 
apk add --no-cache openssh-server openrc git rsync 
mkdir -p /run/openrc 
touch /run/openrc/softlevel 
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
openrc default 
rc-update
apk add rsyslog
rc-update add local default
chown -R mysql: /var/lib/mysql
service mariadb stop
service mariadb setup
service mariadb restart


apk add libc6-compat

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_amd64.tar.gz
tar xf telegraf-1.18.2_linux_amd64.tar.gz