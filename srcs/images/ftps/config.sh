#!/bin/sh
apk update 
apk add --no-cache openssl openrc git rsync \
mkdir -p /run/openrc \
touch /run/openrc/softlevel 
openrc default 
rc-update
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem;

adduser -D admin
echo -e "password\npassword" | passwd admin
