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