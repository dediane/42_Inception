FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql

EXPOSE  9000

COPY    conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /usr/share/wordpress

WORKDIR /usr/share/wordpress

COPY    conf/wp-config.php ./
COPY    configure.sh ./
RUN chmod +x ./configure.sh

ENTRYPOINT ./configure.sh
#RUN sed -i "s/MYSQL_USER/$MYSQL_USER/g" ./wp-config.php && \
#    sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" ./wp-config.php && \
#    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" ./wp-config.php && \
#    sed -i "s/WP_DBHOST/$WP_DBHOST/g" ./wp-config.php

#WORKDIR /var/www/html

#RUN cp /usr/share/wordpress/wp-config.php ./wordpress
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#RUN wp core download --allow-root
#RUN wp core config --dbhost="$WP_DBHOST" --dbname=wp --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
#RUN wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email



#WORKDIR /
