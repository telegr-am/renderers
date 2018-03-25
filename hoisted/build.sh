#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${DIR}

git clone https://github.com/hoisted/hoisted.git

docker build -t shadowfiend/hoisted:latest -f Dockerfile .

rm -rf hoisted/
