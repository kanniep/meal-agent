package models

type Shop struct {
  ID       int `db:"id"`
  Name     string `db:"name"`
  Type     string `db:"type"`
  Location    float32 `db:"location"`
}
