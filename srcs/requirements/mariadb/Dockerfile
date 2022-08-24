FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install mariadb-server -y \
&&		apt-get install gettext-base -y

COPY ./conf/start_mysql.sql /var
COPY ./conf/to_print /var

RUN envsubst < /var/to_print > var/start_mysql.sql
RUN service mysql start; mysql < /var/start_mysql.sql; rm -f /var/start_mysql.sql

ENTRYPOINT [ "mysqld" ]