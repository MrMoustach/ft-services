#!/bin/sh
apk update 
apk add lighttpd nginx php7-common php7-mysqli php7-imap php7-cgi fcgi php7-mbstring php7-cgi openssh
apk add --no-cache openssh-server openssl openrc git rsync \
mkdir -p /run/openrc \
touch /run/openrc/softlevel 

mkdir -p /run/nginx

openrc default 
rc-update

openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

mkdir -p /data/www
wget https://gist.githubusercontent.com/ZiKT1229/5935a10ce818ea7b851ea85ecf55b4da/raw/cd1119f65876d1b5db705ea2dc9097c5f5694ba5/snake.html
mv snake.html /data/www/index.html
/etc/init.d/sshd start
adduser -D admin
echo -e "password\npassword" | passwd admin
