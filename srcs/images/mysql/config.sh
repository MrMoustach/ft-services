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
mysql -u root -e "CREATE USER 'iharchi'@'localhost' IDENTIFIED BY 'wppassword';"
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO iharchi@localhost; FLUSH PRIVILEGES;"
