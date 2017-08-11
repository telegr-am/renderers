#!/usr/bin/env bash

export RENDERER_HOME=$PWD
pushd $(mkdir -p ${RENDERER_HOME}/tmp)
  pushd $(mktemp -p ${RENDERER_HOME}/tmp -d)
    export TEMP_DIR=$PWD
    mkdir ./input
    mkdir ./output
    pushd ./input
      git clone https://github.com/github/training-kit.git ./main
      touch layout.json
    popd

    docker run --rm \
      --mount source=${TEMP_DIR}/input,target=/input,type=bind \
      --mount source=${TEMP_DIR}/output,target=/output,type=bind \
      renderer-jekyll
  popd
popd


