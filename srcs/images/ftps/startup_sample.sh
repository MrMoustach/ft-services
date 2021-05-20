#!/bin/sh
/usr/sbin/pure-ftpd -j -Y 2 -p 21011:21017 -P HTTP_IP &
sed 's/#IS_CONFIGURED="yes"/IS_CONFIGURED="yes"/g' /etc/conf.d/pure-ftpd > /etc/conf.d/pure-ftpd 
service pure-ftpd start
./telegraf-1.18.2/usr/bin/telegraf --config /telegraf-1.18.2/etc/telegraf/telegraf.conf &
top