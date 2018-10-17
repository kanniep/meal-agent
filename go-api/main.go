package main

import (
	"log"
	"github.com/gin-gonic/gin"
	"github.com/kanniep/meal-agent/api/models"
	"github.com/kanniep/meal-agent/api/db"
)

type Meal models.Meal

func Ping(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "pong",
	})
}

func Meals(c *gin.Context) {
	log.Println("Recieved request for meals")
	meals, err := models.GetAllMeals()
	if err != nil {
		c.JSON(500, gin.H{
			"error": err,
		})
	} else {
		c.JSON(200, gin.H{
			"meals": meals,
		})
	}
}

func main() {
	r := gin.Default()

	db.Init()

	r.GET("/ping", Ping)
	r.GET("/meals", Meals)
	// r.POST("/auth/signin", Meals)
	r.Run()
}
