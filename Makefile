NAME = atcoder-env

all:
	docker-compose up -d && docker-compose exec $(NAME) bash

up:
	docker-compose up -d

exec:
	docker-compose exec $(NAME) bash

stop:
	docker-compose stop
