#!/usr/bin/env bash

### WARNING.... mktemp is different on OSX, so don't expect this to work cleanly locally.

export RENDERER_HOME=$PWD
mkdir -p ${RENDERER_HOME}/tmp
pushd $(mktemp -p ${RENDERER_HOME}/tmp -d)
  export TEMP_DIR=$PWD
  mkdir -p ./input
  mkdir -p ./output/html

  cat << EOF > ./input/layout.json
{"version": "1.0",
  "directories": {"main": "https://github.com/mojombo/mojombo.github.io.git"},
  "secrets": []
}
EOF

  docker run --rm \
    --mount source=${TEMP_DIR}/input,target=/input,type=bind \
    --mount source=${TEMP_DIR}/output,target=/output,type=bind \
    renderer-jekyll

  echo "Point your browser to ${TEMP_DIR}/output/html/index.html"
popd


