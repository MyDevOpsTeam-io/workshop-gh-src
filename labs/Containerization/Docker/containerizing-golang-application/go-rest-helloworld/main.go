package main

import (
    "net/http"
	"os"
	"fmt"
    "github.com/gin-gonic/gin"
)

func main() {
	port := os.Getenv("PORT")
	if (port == "") {
		port = "8080" //will use default port
	}
    r := gin.Default()
    r.GET("/helloworld", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"hello": "world",
		})
	})

    r.Run("localhost:" + port)
}
