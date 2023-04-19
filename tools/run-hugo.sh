#!/bin/bash

pushd ../workshop
docker run --rm -it \
    -v $(pwd):/src \
    -p 1313:1313 \
    klakegg/hugo:0.107.0-ext-ubuntu \
  server --disableFastRender --navigateToChanged