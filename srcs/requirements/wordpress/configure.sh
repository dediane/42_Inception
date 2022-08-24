#!/bin/bash

#Create folder for pid php file
ls
mkdir /run/php/
cd /var/www/html/

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then 
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root

    cp  /usr/share/wordpress/wp-config.php ./wordpress
    sed -i "s/MYSQL_USER/$MYSQL_USER/g" ./wp-config.php && \
    sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" ./wp-config.php && \
    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" ./wp-config.php && \
    sed -i "s/WP_DBHOST/$WP_DBHOST/g" ./wp-config.php

    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email

    echo "Wordpress installed & configured with Mariadb"
fi

#start php
php-fpm7.3 --nodaemonize
