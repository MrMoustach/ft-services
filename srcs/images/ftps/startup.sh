#!/bin/sh
/usr/sbin/pure-ftpd -j -Y 2 -p 21011:21017 -P 192.168.99.105 &
sed 's/#IS_CONFIGURED="yes"/IS_CONFIGURED="yes"/g' /etc/conf.d/pure-ftpd > /etc/conf.d/pure-ftpd 
service pure-ftpd start
top