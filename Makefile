NAME = atcoder-env

up:
	docker-compose up -d

exec:
	docker-compose exec $(NAME) bash

stop:
	docker-compose stop