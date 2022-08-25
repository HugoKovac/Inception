all:
	docker-compose -f srcs/docker-compose.yml up 

down:
	docker-compose -f srcs/docker-compose.yml down

re:
	docker-compose -f srcs/docker-compose.yml up --build 

hosts:
	echo "127.0.0.1 hkovac.42.fr" >> /etc/hosts

.PHONY: hosts down clean prune reload all re clean