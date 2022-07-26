FROM debian:buster
LABEL maintainer=hkovac<hkovac@student.42.fr>

RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install nginx -y \
&&		apt-get install openssl -y

CMD ["service", "nginx", "start"]
CMD ["nginx", "-g", "daemon off;"]
# What id daemon and why this option

# run with docker run -td -p 80:80 test2 why -td