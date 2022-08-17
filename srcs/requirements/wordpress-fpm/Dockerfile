FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install php php-fpm -y \
# php-fpm7.3
&&		apt-get install wget -y

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp 



