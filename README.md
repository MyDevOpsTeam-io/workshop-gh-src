![MyDevOpsTeam](https://mydevopsteam.io/wp-content/uploads/2022/05/MyDevOpsTeam-Logo.png)

# MyDevOpsTeam.io Workshop GoHugo

![MyDevOpsTeam](https://img.shields.io/badge/MyDevOpsTeam.io-blue)
![Cloud Native](https://img.shields.io/badge/Cloud%20-Native-blue)

![Github Pages](https://img.shields.io/badge/github%20pages-121013?style=for-the-badge&logo=github&logoColor=white)

## Environment Setup

| Image Version                           |
| --------------------------------------- |
| klakegg/hugo:0.107.0-ext-ubuntu-onbuild |

#### Pulling Hugo Docker image:

```bash
docker pull klakegg/hugo:0.107.0-ext-ubuntu-onbuild
```

#### Clone this repo:

From wherever you checkout repos(or your fork):

```shell
git clone https://github.com/MyDevOpsTeam-io/workshop-gh-src.git
```

#### Specify Hugo theme:

```bash
git submodule add https://github.com/matcornic/hugo-theme-learn themes/hugo-theme-learn
echo "theme = 'hugo-theme-learn'" >> config.toml
```

#### Run Hugo locally:

```bash
docker run --rm -it \
    -v $(pwd):/src \
    -p 1313:1313 \
    klakegg/hugo:0.107.0-ext-ubuntu-onbuild \
  server --watch --disableFastRender
```

#### View Hugo locally:

Visit http://localhost:1313/ to see the site.

#### Making Edits:

As you save edits to a page, the site will live-reload to show your changes.

#### Building Hugo for production:

```bash
docker run --rm -it \
    -v $(pwd):/src \
    klakegg/hugo:0.107.0-ext-ubuntu-onbuild \
    --gc \
    --minify \
    --baseURL "https://workshops.mydevopsteam.io"
```

or proceed to [Local Build](tools/README.md)

```bash
https://github.com/MyDevOpsTeam-io/workshop-gh-src.git
cd workshop-gh-src/tools
chmod +x build-hugo-prod-local.sh
./build-hugo-prod-local.sh
```

## Commit Hooks

### pre-commit installation:

```bash
sudo pip3 install pre-commit
```

### Setup pre-commit hooks:

```bash
pre-commit install
```
