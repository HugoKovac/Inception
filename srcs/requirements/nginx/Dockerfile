FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install nginx -y \
&&		apt-get install openssl -y \
&&		mkdir /var/ssl/

ADD ./conf/core.conf /etc/nginx/conf.d/core.conf
ADD ./conf/auth_ssl/ /var/ssl/

# RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#         -keyout /var/ssl/nginx.key -out /var/ssl/nginx.crt \
#         -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=hkovac/CN=localhost"
CMD ["nginx", "-g", "daemon off;"]

