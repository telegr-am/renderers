#!/usr/bin/env bash

cd /input/main
npm install
gatsby build

mkdir -p /output/html
mv ./public/* /output/html

