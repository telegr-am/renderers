#!/usr/bin/env bash

cd /input/main
yarn install
gatsby build

mkdir -p /output/html
mv ./public/* /output/html

