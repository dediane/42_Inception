all:
	cd srcs && docker-compose up
clean:
	docker system prune -af
re:
	cd srcs && docker-compose up --build
hosts:
	echo "127.0.0.1 ddecourt.42.fr" >> /etc/hosts 