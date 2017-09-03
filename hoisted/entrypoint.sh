#!/usr/bin/env bash

java -jar /usr/local/lib/hoisted.jar -locale "${TG_USER_LOCALE}" \
          -tz "${TG_USER_TIMEZONE}" \
          -site "${TG_USER_SITE}" \
          /input/main /output/html
