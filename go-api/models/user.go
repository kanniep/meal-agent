package models

import db_manager "github.com/kanniep/meal-agent/api/db"

type User struct {
    Email     string `db:"email"`
    Password  string `db:"password"`
    Shop      int `db:"shope_id"`
}

func signUp(email, password string) error {
  db := db_manager.GetPool()
  _, err := db.NamedExec(`INSERT INTO users (email,password) VALUES (:em,:pw)`,
    map[string]interface{}{
      "em": email,
      "pw": password})
  return err
}

func signIn(email, password string) (*User ,error) {
  db := db_manager.GetPool()
  user := &User{}
  err := db.Get(&user, `SELECT * FROM users WHERE email=:em and password=:pw`,
    map[string]interface{}{
      "em": email,
      "pw": password})
  if err != nil {
    return nil, err
  }
  return user, nil
}
