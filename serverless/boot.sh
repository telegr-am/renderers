#!/usr/bin/env bash

# Bootstrap the serverless deployment

set -e

die() { echo "$@" 1>&2 ; exit 1; }

source /input/_secrets/serverless_conf || die "No serverless credentials"

cp -r /input/serverless /tmp/serverless || die "Failed to copy /input/serverless to workspace"

cd /tmp/serverless

WHICH_REGION="${SERVERLESS_REGION:=us-east-1}"

serverless deploy --stage production --region "${WHICH_REGION}" 2>&1 > /tmp/deploy_info.txt || \
    die "Failed to deploy $(cat /tmp/deploy_info.txt)"

ls -l /tmp/*.txt
