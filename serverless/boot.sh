#!/usr/bin/env bash

# Bootstrap the serverless deployment

set -e

echo "Starting Serverless deploy"

die() { echo "$@" 1>&2 ; exit 1; }

source /input/_secrets/serverless_conf || die "No serverless credentials"

cp -r /input/serverless /tmp/serverless || die "Failed to copy /input/serverless to workspace"

cd /tmp/serverless

WHICH_REGION="${SERVERLESS_REGION:=us-east-1}"

serverless deploy --stage production --region "${WHICH_REGION}" 2>&1 > /tmp/deploy_info.txt || \
    die "Failed to deploy $(cat /tmp/deploy_info.txt)"

echo "Succeeded in deploying... here's the output"

cat /tmp/deploy_info.txt || die "Couldn't cat"

create_routing.py /tmp/deploy_info.txt /input/serverless/serverless.yml /output/routing.json || \
    die "Failed to create routing"

