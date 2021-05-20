#!/bin/sh

service mariadb restart
./telegraf-1.18.2/usr/bin/telegraf --config /telegraf-1.18.2/etc/telegraf/telegraf.conf &

top