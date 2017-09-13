#!/usr/bin/env bash

for x in $(find . -name "build.sh"); do
    ${x}
done
