#!/usr/bin/env bash

export RENDERER_HOME=$PWD
mkdir -p ${RENDERER_HOME}/tmp
pushd $(mktemp -p ${RENDERER_HOME}/tmp -d)
  export TEMP_DIR=$PWD
  mkdir -p ./input/main
  echo "<html><head><title>Yo!</title></head><body>Dawg!</body></html>" > ./input/main/index.html
  mkdir -p ./output/html

  docker run --rm \
    -ti \
    --user="$(id -u $USER):$(id -g $USER)" \
    --mount source=${TEMP_DIR}/input,target=/input,type=bind \
    --mount source=${TEMP_DIR}/output,target=/output,type=bind \
    opentelegram/passthru:latest

  echo "Point your browser to ${TEMP_DIR}/output/html/index.html"
popd


