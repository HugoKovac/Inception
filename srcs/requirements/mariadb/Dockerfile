FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install mariadb-server -y

COPY ./conf/start_mysql.sql /var

RUN service mysql start; mysql < /var/start_mysql.sql; rm -f /var/start_mysql.sql

ENTRYPOINT [ "mysqld" ]