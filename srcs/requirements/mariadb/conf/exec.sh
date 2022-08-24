#!/bin/bash

service mysql start

mysql -e "DELETE FROM mysql.user WHERE User='';";
mysql -e "CREATE USER IF NOT EXISTS'$MYSQL_USER'@'localhost' identified by '$MYSQL_PASSWORD';";
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';";
mysql -e "FLUSH PRIVILEGES;"

killall mysqld

mysqld
