# Tools

To build hugo site locally, execute the script via:

```bash
chmod +x build-hugo-prod-local.sh
./build-hugo-prod-local.sh
```

To test it, you can test it through nginx proxy via docker:

```bash
docker run --rm \
    -it \
    -p 8080:80 \
    --name hugo-nginx-server \
    -v <hugo-compiled-source>:/usr/share/nginx/html nginx:latest
```
