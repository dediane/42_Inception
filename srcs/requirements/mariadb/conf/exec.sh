#!/bin/bash
killall mysqld


#mysql_install_db

service mysql start
sleep 5
#mysql -e "FLUSH PRIVILEGES;"
mysql -e "DELETE FROM mysql.user WHERE User='';";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";

mysql -e "CREATE DATABASE wordpress;";
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;";
mysql -e "FLUSH PRIVILEGES;"


killall mysqld
mysqld
