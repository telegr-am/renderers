#!/usr/bin/env sh

ls -l /input/main/
cd /input/main
/usr/local/sbin/hugo 

mkdir -p /output/html
mv ./public/* /output/html

