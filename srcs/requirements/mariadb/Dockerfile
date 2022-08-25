FROM alpine:3.15.0

# install prerequisites
RUN apk update && \
  apk add --no-cache \
  mariadb mariadb-client

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/script.sh /
ENTRYPOINT ["sh", "/script.sh"]

EXPOSE 3306
STOPSIGNAL SIGQUIT

VOLUME ["/var/lib/mysql"]

CMD ["mysqld_safe"]