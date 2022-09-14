all: up

up:
	cd srcs && docker-compose up
down:
	cd srcs && docker-compose down
	
clean:
	docker system prune -af

re:
	cd srcs && docker-compose up --build