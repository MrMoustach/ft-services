#!/bin/sh
service mariadb setup
service mariadb restart
echo "creating db"
mysql -u root -e "CREATE USER 'iharchi'@'%' IDENTIFIED BY 'wppassword';"
mysql -u root -e "CREATE DATABASE wordpress; use wordpress; source /temp/wordpress.sql;SELECT * from user"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'iharchi'@'%'; FLUSH PRIVILEGES;"
./telegraf-1.18.2/usr/bin/telegraf --config /telegraf-1.18.2/etc/telegraf/telegraf.conf &

top