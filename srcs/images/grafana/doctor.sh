#!/bin/sh
if [ "$(ps | grep grafana | grep -vc grep)" = 0 ]
then
    exit 15
else
    exit 0
fi