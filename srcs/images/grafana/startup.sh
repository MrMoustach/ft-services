#!/bin/sh
./telegraf-1.18.2/usr/bin/telegraf --config /telegraf-1.18.2/etc/telegraf/telegraf.conf &
cd /grafana-7.5.6/bin
./grafana-server web &
top