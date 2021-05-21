#!/bin/sh
if [ "$(ps | grep influxdb | grep -vc grep)" = 0 ]
then
    exit 15
else
    exit 0
fi