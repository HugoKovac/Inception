FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install nginx -y \
&&		apt-get install openssl -y \
&&		mkdir /var/ssl/m

ADD ./conf/core.conf /etc/nginx/conf.d/core.conf
ADD ./conf/auth_ssl/ /var/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

