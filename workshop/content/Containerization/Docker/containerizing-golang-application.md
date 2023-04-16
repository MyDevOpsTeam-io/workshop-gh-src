---
title: "Containerizing golang application"
weight: 3
tags: ["container", "beginner", "basic", "Go", "Docker"]
---

![MyDevOpsTeam](/images/MyDevOpsTeam-Logo.png?width=20pc)
![Golang](/images/golang.png?width=15pc)


### What is Go?

Go is a statically typed, compiled high-level programming language designed at Google by Robert Griesemer, Rob Pike, and Ken Thompson. It is syntactically similar to C, but with memory safety, garbage collection, structural typing, and CSP-style concurrency.


### Prerequisite:
- [Make CLI (GNU Make)](https://www.gnu.org/software/make/)
- [Docker CLI](https://docker.com)

### Create your first golang app:

1. Create your `hello-world-go` project:

```bash
mkdir go-rest-helloworld
cd go-rest-helloworld
go mod init golang/go-rest-helloworld
```

2. Create `Makefile` to build your go app to avoid repeatable commands:
Fire up the editor and add the ff:

Then, add the following content:

```bash
FILE = main.go
BINARY = main
IMAGE = "go-helloworld:latest"


build: $(FILE)
	echo "[INFO]: Building package $(FILE)"
	go mod tidy && go build -o main $(FILE) && chmod +x $(FILE)

run:
	echo "[*] Running the hello-world-app...."
	./$(BINARY)

build-image:
	echo "[INFO]: Docker image $(IMAGE) build process starting ..."
	docker build -t $(IMAGE) .

run-container:
	docker run -it --name go-helloworld --rm -p ${PORT}:${PORT} $(IMAGE)
```

3. Create `main.go` file:

```bash
vim main.go
```

```go
package main

import (
    "net/http"
    "fmt"
    "github.com/gin-gonic/gin"
)


func main() {
    router := gin.Default()
    r.GET("/helloworld", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"hello": "world",
		})
	})

    router.Run("localhost:8080")
}
```

4. Build the app via:
```bash
make build
```

5. Run the app via:
```bash
make run
```
Now, make some request via:
```bash
curl http://localhost:8080/helloworld
```

Output:
```bash
{"hello":"world"}
```

### The Problem: What if you want to use port other than port `8080`?

We can use environment variable to dynamically specify different port on our application so we don't have to re-build it when we want to use port other than `8080`:

6. Setup environment variable on your code:

We will be using ***OS*** package a built-in go package. Add the following code on the top of your **hello-world-app**:
```go
import (
    "net/http"
    "github.com/gin-gonic/gin"
    "fmt"
    "os" // package that can be use to interact with OS environment variable.
)
```

7. Create a variable that will get the port number using `os.getEnv` inside the `main()` function and `if` statement that if `PORT` env variable is not specified, the app will use the default port which is `8080`:

```go
port := os.Getenv("PORT")
	if (port == "") {
		port = "8080" //will use default port
	}
```

8. Add the port variable into the `r.Run()` function:
```go
r.Run("localhost:" + port)
```

9. Test and run it via:
```bash
export PORT="9090"
make run
```

Output:
```bash
[*] Running the hello-world-app....
./main
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /helloworld               --> main.main.func1 (3 handlers)
[GIN-debug] [WARNING] You trusted all proxies, this is NOT safe. We recommend you to set a value.
Please check https://pkg.go.dev/github.com/gin-gonic/gin#readme-don-t-trust-all-proxies for details.
[GIN-debug] Listening and serving HTTP on localhost:9090
```

As you can see at the line here:
```bash
[GIN-debug] Listening and serving HTTP on localhost:9090
```

It is now using port other than `8080`!

10. Create a `Dockerfile`:
```bash
FROM golang:1.19-alpine

WORKDIR /opt/go-rest-helloworld

RUN apk update && apk add curl make

ADD main.go /opt/go-rest-helloworld

RUN cd /opt/go-rest-helloworld && make build

CMD ["exec /opt/go-rest-helloworld/main"]
```

11. Test the docker image via:
```bash
export PORT="8888"
make run-container
```

Source code for lab exercise can be found here at the labs folder: **containerizing-golang-application**