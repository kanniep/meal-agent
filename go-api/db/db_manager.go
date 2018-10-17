package db

import (
  "log"
  "time"
  _ "github.com/lib/pq"
  "github.com/jmoiron/sqlx"
)

var (
	pool *sqlx.DB
	err error
	)
func Init() {
	pool, err = sqlx.Open("postgres", "user=goapp password=golang21341722 dbname=meal_agent_dev sslmode=disable")
	pool.SetMaxIdleConns(5)
	pool.SetConnMaxLifetime(2 * time.Minute)
	pool.SetMaxOpenConns(95)
	if err != nil {
		log.Println("m=GetPool,msg=connection has failed", err)
	} else {
    log.Println("Successfully initial DB")
  }
}

func GetPool() (*sqlx.DB) {
	return pool
}
