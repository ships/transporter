#!/bin/bash -ex

bosh deploy $REPO_ROOT/installations/openvpn-server/manifest.yml \
  -d vpn \
  --vars-file $REPO_ROOT/installations/openvpn-server/variables.yml
