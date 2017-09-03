#!/usr/bin/env bash

cd /input/
cp -r main /tmp/
cd /tmp/main/
npm install
gatsby build

mv ./public/* /output/html

