#!/bin/sh
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
openrc default 
rc-update
apk add rsyslog
rc-update add local default
chown -R mysql: /var/lib/mysql
service mariadb stop
service mariadb setup
service mariadb restart
echo "creating db"
mysql -u root -e "CREATE USER 'iharchi'@'%' IDENTIFIED BY 'wppassword';"
mysql -u root -e "CREATE DATABASE wordpress; use wordpress; source /temp/wordpress.sql;SELECT * from user"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'iharchi'@'%'; FLUSH PRIVILEGES;"

apk add libc6-compat

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_amd64.tar.gz
tar xf telegraf-1.18.2_linux_amd64.tar.gz