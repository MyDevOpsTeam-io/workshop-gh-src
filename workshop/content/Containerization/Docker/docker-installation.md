---
title: "Docker installation"
weight: 1
tags: ["container", "basics"]
---

![MyDevOpsTeam](/images/MyDevOpsTeam-Logo.png?width=20pc)
![Docker](/images/docker-icon.png?width=15pc)

- [Installation on Linux](#installation-on-linux)
- [Installation on Windows](#installation-on-windows)
- [Installation on MacOS](#installation-on-macos)

### Installation on Linux

To install it on linux, fireup your terminal and run:

**_Note: You must have atleast sudo powers! And version will differ based on your linux distro._**

```bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl enable --now docker
```

Now, add your non-root user to the docker group:

```bash
export IAMUSER=`whoami`
sudo usermod -aG docker $IAMUSER
```

Let's test it:

```bash
docker run -it --rm -p 8080:8080 nginx:latest
```

Try and visit the url [http://localhost:8080](http://localhost:8080)

### Installation on Windows

You can follow the instruction here at the [Docker offical website](https://docs.docker.com/desktop/install/windows-install/).

### Installation on MacOS

You can follow the instruction here at the [Docker offical website](https://docs.docker.com/desktop/install/mac-install/).

You should now be able to run it on your machine.
