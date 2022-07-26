FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install nginx -y \
&&		apt-get install openssl -y

CMD ["service", "nginx", "start"]