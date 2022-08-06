FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install php-fpm -y \
# php-fpm7.3
&&		apt-get install curl -y \
&&		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/ \
&&		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp


