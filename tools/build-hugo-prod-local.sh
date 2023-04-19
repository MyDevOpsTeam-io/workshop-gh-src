#!/bin/bash

which docker &> /dev/null
is_docker=$?
if [ $is_docker -eq 0 ]; then
        pushd ../workshop
        echo "[*] Compiling hugo site...."
        docker run --rm -it \
            -v $(pwd):/src \
            klakegg/hugo:0.107.0-ext-ubuntu \
            --gc \
            --minify \
            --baseURL "https://workshops.mydevopsteam.io"

        sudo chown -R $USER:$USER public
        tmp=`mktemp -d`
        cp -r public $tmp
        echo "[OK] Your compile hugo site can be found here $tmp/public ...."
else
        echo "[!] Docker is not available on your machine..."
        exit -1
fi

