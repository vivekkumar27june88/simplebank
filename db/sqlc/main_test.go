package db

import (
	"database/sql"
	_ "github.com/lib/pq"
	"log"
	"os"

	"testing"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:postgres@localhost:5433/simple_bank?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to database")
	}

	testQueries = New(conn)

	os.Exit(m.Run())
}
