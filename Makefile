.PHONY: dev test migrate

dev:
	npm run start:dev

test:
	npm run test

migrate:
	npm run migration:run
