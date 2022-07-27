FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install nginx -y \
&&		apt-get install openssl -y

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

