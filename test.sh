#!/usr/bin/env bash

export RENDERER_HOME=$PWD

pushd $(mktemp -d)
  export TEMP_DIR=$PWD
  mkdir ./input
  mkdir ./output
  pushd ./input
    git clone https://github.com/github/training-kit.git ./main
    touch layout.json
  popd

  docker run --rm \
    --mount source=input,target=/input \
    --mount source=output,target=/output \
    renderer-jekyll
popd


