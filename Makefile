postgres:
    docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
    docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
    docker exec -it postgres12 dropdb simple_bank

migrateup:
		migrate -path migrations -database "mysql://data:secret@tcp(localhost)/data" -verbose up

migratedown:
		migrate -path migrations -database "mysql://data:secret@tcp(localhost)/data" -verbose down

migrate-create:
		migrate create -ext sql -dir migrations first

.PHONY: postgres createdb dropdb migrateup migratedown
`
