# Creating your first docker container

#### Pre-requisites

- [Docker Installation](/containerization/docker/docker-installation/)

1. Initiate your project. Create a folder called `my-first-docker-project` and `contents` folder:

```bash
mkdir my-first-docker-project contents
```

2. Create a file called `Dockerfile`:

```bash
touch Dockerfile
vim Dockerfile
```

3. Add the following contents:

```bash
FROM nginx:latest

COPY contents /usr/share/nginx/html
```

4. Create `index.html` file inside the `contents` folder for your static page that will be served by NGINX proxy. Run the command via:

```bash
vim contents/index.html
```

Then, add the following content:

```html
<!DOCTYPE HTML>
<head>
    <title>My First Container</title>
</head>
<body>
    <center>
    <h1>Welcome to my First Container</title>
    </center>
</body>
</html>
```

5. Build your container using the following commands. For example: `docker build -t <your-target-image-name> .`

```bash
docker build -t my-first-container:latest .
```

6. Run your container:

```bash
docker run -it --rm -p 8080:80 my-first-container:latest
```

7. You should have an output like this:

```
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/04/15 12:57:45 [notice] 1#1: using the "epoll" event method
2023/04/15 12:57:45 [notice] 1#1: nginx/1.23.4
2023/04/15 12:57:45 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6)
2023/04/15 12:57:45 [notice] 1#1: OS: Linux 5.10.16.3-microsoft-standard-WSL2
2023/04/15 12:57:45 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/04/15 12:57:45 [notice] 1#1: start worker processes
2023/04/15 12:57:45 [notice] 1#1: start worker process 29
2023/04/15 12:57:45 [notice] 1#1: start worker process 30
2023/04/15 12:57:45 [notice] 1#1: start worker process 31
2023/04/15 12:57:45 [notice] 1#1: start worker process 32
2023/04/15 12:57:45 [notice] 1#1: start worker process 33
2023/04/15 12:57:45 [notice] 1#1: start worker process 34
2023/04/15 12:57:45 [notice] 1#1: start worker process 35
2023/04/15 12:57:45 [notice] 1#1: start worker process 36
```

8. Now, that your container is up and running. You can access it via: [http://localhost:8080](http://localhost:8080)

