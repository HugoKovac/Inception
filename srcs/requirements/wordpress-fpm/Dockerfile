FROM alpine:3.15.6
LABEL maintainer=hkovac<hkovac@student.42.fr>

# Install packages required for WordPress and WP-CLI
RUN apk update && \
  apk add --no-cache \
  curl \
  mariadb-client \
  php8 \
  php8-fpm php8-json php8-zlib php8-xml php8-xmlwriter php8-simplexml php8-pdo php8-phar php8-openssl \
  php8-curl php8-opcache php8-ctype php8-apcu \
  php8-gd php8-iconv php8-gmp php8-zip \
  php8-pdo_mysql php8-mysqli php8-session \
  php8-intl php8-bcmath php8-dom php8-mbstring php8-xmlreader php8-redis php8-tokenizer

# COPY ./conf/wp-cli.yml /
COPY conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./conf/config.sh /var
# COPY ./conf/wp-config.php /

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/local/bin/wp && \
  ln -s /usr/bin/php8 /usr/bin/php && \
  adduser -D -H -u 82 -s /sbin/nologin www-data -G www-data

ENTRYPOINT ["sh", "/var/config.sh"]

STOPSIGNAL SIGQUIT

CMD ["php-fpm8", "-F"]
# CMD ["tail", "-f", "/dev/null"]
