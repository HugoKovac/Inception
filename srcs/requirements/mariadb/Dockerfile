FROM alpine:3.15.0

RUN apk update && \
  apk add --no-cache \
  mariadb mariadb-client

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/script.sh /
ENTRYPOINT ["sh", "/script.sh"]

STOPSIGNAL SIGQUIT

CMD ["mysqld_safe"]