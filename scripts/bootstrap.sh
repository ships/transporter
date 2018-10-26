#!/bin/bash -ex

if [ -z "$BBL_GCP_SERVICE_ACCOUNT_KEY" ]; then
  if [ -z "$1" ]; then
    echo "please set BBL_GCP_SERVICE_ACCOUNT_KEY as the path to your key, or pass it in as an argument to this script"
    exit 1
  else
    export BBL_GCP_SERVICE_ACCOUNT_KEY="$1"
  fi
fi

bbl plan --name transporter

bbl up --name transporter --debug

direnv reload
