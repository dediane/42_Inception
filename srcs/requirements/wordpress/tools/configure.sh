#!/bin/bash

sleep 20

if [ ! -f /run/php/ ]; then
    mkdir /run/php/ 2>/dev/null
fi
cd /var/www/html

if [ ! -f /var/www/html/test.sh ]; then 
    cp  /usr/share/wordpress/wp-config.php ./wp-config.php
    sed -i "s/MYSQL_USER/$MYSQL_USER/g" ./wp-config.php && \
    sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" ./wp-config.php && \
    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" ./wp-config.php && \
    sed -i "s/WP_DBHOST/$WP_DBHOST/g" ./wp-config.php

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root
    
    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
    echo "WP admin user = $WP_ADMIN"
    echo "WP password for admin user = $WP_ADMIN_PWD"

    wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author --allow-root
    echo "WP user created, login=$WP_USER & password=$WP_USER_PWD"

    echo "Wordpress installed & configured with Mariadb"
    touch test.sh

fi

echo "Wordpress ready"
#start php
php-fpm7.3 --nodaemonize
