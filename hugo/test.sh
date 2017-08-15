#!/usr/bin/env bash

export RENDERER_HOME=$PWD
mkdir -p ${RENDERER_HOME}/tmp
pushd $(mktemp -p ${RENDERER_HOME}/tmp -d)
  export TEMP_DIR=$PWD
  mkdir -p ./input/main
  mkdir -p ./output/html

  git clone https://github.com/gohugoio/hugo.git ./hugo
  mv ./hugo/examples/blog/* ./input/main
  touch ./input/layout.json

  docker run --rm \
    --mount source=${TEMP_DIR}/input,target=/input,type=bind \
    --mount source=${TEMP_DIR}/output,target=/output,type=bind \
    renderer-hugo

  echo "Point your browser to ${TEMP_DIR}/output/html/index.html"
popd


