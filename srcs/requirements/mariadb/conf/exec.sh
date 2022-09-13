#!/bin/bash
if [ "$(ls -A /var/lib/mysql)" ];then
    service mysql start 2> /dev/null;
fi

#mysql -p$MYSQL_ROOT_PASSWORD -e ""
if [ $? -ne 0 ] || [ ! -d /var/lib/mysql/wordpress ]; then
    echo "Need to config wordpress DB"
    killall mysqld
    mysql_install_db &> /dev/null;
    service mysql start 2> /dev/null;

    mysql -e "DELETE FROM mysql.user WHERE User='';";
    mysql -e "CREATE DATABASE wordpress;";
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;";
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;";
else
    echo "Wordpress DB exist already.";
fi

killall mysqld
mysqld
