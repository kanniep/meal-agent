package models

import (
  "log"
)
import db_manager "github.com/kanniep/meal-agent/api/db"

type Meal struct {
  ID          int `db:"id"`
  Name        string `db:"name"`
  Type        string `db:"type"`
  Price       float32 `db:"price"`
  Description string `db:"description"`
  Shop        Shop `db:"shop_id"`
}

func GetAllMeals() ([]Meal, error) {
  db := db_manager.GetPool()
  meals := []Meal{}
  err := db.Select(&meals, "SELECT * FROM meals")
  if err != nil{
		log.Println("Unable to get all meal,", err)
    return nil, err
	}
  return meals, nil
}

func CreateMeal(meal Meal) ([]Meal, error) {
  db := db_manager.GetPool()
  meals := []Meal{}
  err := db.Select(&meals, "SELECT * FROM meals")
  if err != nil{
		log.Println("Unable to get all meal,", err)
    return nil, err
	}
  return meals, nil
}
