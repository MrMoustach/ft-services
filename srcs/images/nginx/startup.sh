#!/bin/sh

rc-service nginx start
/etc/init.d/sshd restart
top