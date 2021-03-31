build:
	docker-compose build --no-cache --force-rm
up:
	docker-compose up -d
laravel-install:
	docker-compose exec app composer create-project --prefer-dist laravel/laravel .
	docker-compose exec app composer install
	cp ./.appenv ./src/.env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan storage:link
create-project:
	@make build
	@make up
	@make laravel-install
