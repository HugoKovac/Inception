all: prune reload

hosts:
	echo "127.0.0.1 hkovac.42.fr" >> /etc/hosts

prune: clean
	docker system prune -f

reload:
	cp srcs/requirements/wordpress-fpm/conf/wp-config.php /home/hkovac/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

re: down all

clean:
	rm -rf /home/hkovac/data/db/*

.PHONY: hosts down clean prune reload all re clean