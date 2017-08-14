#!/usr/bin/env bash

export RENDERER_HOME=$PWD
mkdir -p ${RENDERER_HOME}/tmp
pushd $(mktemp -p ${RENDERER_HOME}/tmp -d)
  export TEMP_DIR=$PWD
  mkdir -p ./input
  mkdir -p ./output/html
  pushd ./input
    git clone https://github.com/DSchau/blog.git ./main
    touch layout.json
  popd

  docker run --rm \
    --mount source=${TEMP_DIR}/input,target=/input,type=bind \
    --mount source=${TEMP_DIR}/output,target=/output,type=bind \
    renderer-gatsby

  echo "Point your browser to ${TEMP_DIR}/output/html/index.html"
popd


