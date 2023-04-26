postgres:
	docker run --name postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=root -p5433:5432  -d postgres

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres dropdb --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migration -database="postgresql://root:postgres@localhost:5433/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database="postgresql://root:postgres@localhost:5433/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb createdb dropdb migrateup migratedown sqlc
