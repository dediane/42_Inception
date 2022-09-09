#!/bin/bash

#while ! mariadb -h$WP_DBHOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE &> /dev/null; do
#    sleep 5;
#done

mkdir /run/php/
cd /var/www/html/wordpress

#if [ ! -f /var/www/html/wp-config.php ]; then 
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root
    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
    echo "WP admin user = $WP_ADMIN"
    echo "WP password for admin user = $WP_ADMIN_PWD"

    cp  /usr/share/wordpress/wp-config.php ./wp-config.php
    sed -i "s/MYSQL_USER/$MYSQL_USER/g" ./wp-config.php && \
    sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" ./wp-config.php && \
    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" ./wp-config.php && \
    sed -i "s/WP_DBHOST/$WP_DBHOST/g" ./wp-config.php

    #wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WP_DBHOST --dbcharset="utf8" --dbcollate="utf8_general_ci"

    echo "Wordpress installed & configured with Mariadb"
#fi

#start php
php-fpm7.3 --nodaemonize

# #Create folder for pid php file
# # mkdir /run/php/

# # cd /var/www/html/wordpress

# #if [ ! -f /var/www/html/wordpress/wp-config.php ]; then 
#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#     chmod +x wp-cli.phar
#     mv wp-cli.phar /usr/local/bin/wp
#     wp core download --allow-root
#     wp core install --allow-root --url="$WP_URL" --tiutle="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
#     wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
# #     cp  /usr/share/wordpress/wp-config.php /var/www/html/wp-config.php
# #     sed -i "s/MYSQL_USER/$MYSQL_USER/g" /var/www/html/wp-config.php && \
# #     sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /var/www/html/wp-config.php && \
# #     sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /var/www/html/wp-config.php && \
# #     sed -i "s/WP_DBHOST/$WP_DBHOST/g" /var/www/html/wp-config.php

# #fi


# #     echo "Wordpress installed & configured with Mariadb"
# # fi

# #start php
# php-fpm7.3 --nodaemonize
