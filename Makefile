default: up

up:
	docker-compose up --build

build:
	docker-compose build

hard_reset_to_master:
	docker-compose down
	git fetch
	git checkout -f master
	git reset --hard origin/master
	git submodule foreach 'git fetch && git checkout -f master && git reset --hard origin/master'
	docker-compose build
	docker-compose up

implode:
	docker-compose down --rmi all