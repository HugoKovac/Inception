all: prune reload

hosts:
	echo "127.0.0.1 hkovac.42.fr" >> /etc/hosts

prune: clean
	docker system prune -f

reload: 
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

re: down all


# clean: reload
# 	rm -rf ~/Desktop/inception
#remove ?

.PHONY: hosts down clean prune reload all re