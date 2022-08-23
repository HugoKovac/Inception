FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install php php-fpm php-mysql -y \
# php-fpm7.3
&&		apt-get install wget -y

RUN		adduser --system php && addgroup --system php \
&&		mkdir -p /run/php

COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/config.sh /

CMD [ "bash", "/config.sh" ]



