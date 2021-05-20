#!/bin/sh
rc-service php-fpm7 start
rc-service nginx start
./telegraf-1.18.2/usr/bin/telegraf --config /telegraf-1.18.2/etc/telegraf/telegraf.conf &
top