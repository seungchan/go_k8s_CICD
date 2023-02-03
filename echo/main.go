package main

import (
	"net/http"
	"os"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {

	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	echoPort := os.Getenv("ECHO_PORT")
	if echoPort == "" {
		echoPort = "8080"
	}

	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "Hello, World of GO!\n")
	})

	e.GET("/health", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
	
	e.Logger.Fatal(e.Start(":" + echoPort))
}