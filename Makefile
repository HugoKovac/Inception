all:
	if [ ! -d "/home/hkovac/data" ]; then mkdir -p /home/hkovac/data; fi

	if [ ! -d "/home/hkovac/data/wordpress" ]; then mkdir -p /home/hkovac/data/wordpress; fi
	
	if [ ! -d "/home/hkovac/data/db" ]; then mkdir -p /home/hkovac/data/db; fi
	
	docker-compose -f srcs/docker-compose.yml up #-d

down:
	docker-compose -f srcs/docker-compose.yml down

re:
	if [ ! -d "/home/hkovac/data" ]; then mkdir -p /home/hkovac/data; fi

	if [ ! -d "/home/hkovac/data/wordpress" ]; then mkdir -p /home/hkovac/data/wordpress; fi
	
	if [ ! -d "/home/hkovac/data/db" ]; then mkdir -p /home/hkovac/data/db; fi
	
	docker-compose -f srcs/docker-compose.yml up --build #-d


#sudo docker stop $(sudo docker ps -qa); sudo docker rm $(sudo docker ps -qa); sudo docker rmi -f $(sudo docker images -qa); sudo docker volume rm $(sudo docker volume ls -q); sudo docker network rm $(sudo docker network ls -q) 2> /dev/null

hosts:
	echo "127.0.0.1 hkovac.42.fr" >> /etc/hosts

.PHONY: hosts down clean prune reload all re clean