FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server 

COPY conf/my.cnf /root/my.cnf

RUN mkdir /usr/share/mariadb
WORKDIR /usr/share/mariadb

COPY conf/exec.sh ./

RUN ["/usr/bin/install" , "-m", "755", "-o", "mysql", "-g", "root", "-d", "/var/run/mysqld"]

CMD chmod +x ./exec.sh

EXPOSE 3306

ENTRYPOINT sh ./exec.sh
