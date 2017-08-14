#!/usr/bin/env bash

export main=`jq --raw-output '.directories.main' /input/layout.json`
git clone ${main} /input/main

jekyll build --source /input/main --destination /output/html

