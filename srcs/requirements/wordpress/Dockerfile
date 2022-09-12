FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql

EXPOSE  9000

COPY    ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN     mkdir /usr/share/wordpress
WORKDIR /usr/share/wordpress

COPY    tools/wp-config.php ./
COPY    tools/configure.sh ./
RUN     chmod +x ./configure.sh

ENTRYPOINT ./configure.sh