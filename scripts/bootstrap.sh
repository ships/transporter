#!/bin/bash -ex

export REPO_ROOT="$(cd $BBL_STATE_DIR/../.. && pwd)"

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

bosh update-config \
  --type cloud \
  --name vip \
  $REPO_ROOT/installations/configs/cloud/vip-network.yml

bosh update-config \
  --type runtime \
  --name dns \
  $REPO_ROOT/installations/configs/runtime/dns.yml

# credhub generate \
#   -n /root_ca \
#   -t certificate \
#   --no-overwrite \
#   --duration 3650 \
#   --common-name "transporter root CA" \
#   --is-ca

$REPO_ROOT/installations/openvpn-server/deploy.sh

