FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y openssl nginx 

RUN mkdir -p /etc/nginx/ssl


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/ddecourt.42.fr.pem \
    -keyout /etc/nginx/ssl/ddecourt.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=ddecourt/CN=ddecourt.42.fr"

#RUN chown -R root:root /etc/nginx/ssl

#RUN chmod -R 600 /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]