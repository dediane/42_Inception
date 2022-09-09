#!/bin/bash
killall mysqld

killall mysqld
rm -rf /var/lib/mysql/*
mysql_install_db

service mysql start

mysql -e "DELETE FROM mysql.user WHERE User='';";

mysql -e "CREATE DATABASE wordpress;";
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;";


killall mysqld
mysqld
