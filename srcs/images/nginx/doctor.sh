#!/bin/sh
if [ "$(ps | grep nginx | grep -vc grep)" = 0 -o "$(ps | grep ssh | grep -vc grep)" = 0 -o "$(ps | grep telegraf | grep -vc grep)" = 0 ]
then
    exit 15
else
    exit 0
fi