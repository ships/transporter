#!/bin/bash -eux

this_dir="$REPO_ROOT/installations/concourse-lite"

bosh deploy "$this_dir/manifest.yml" \
  --vars-file "$this_dir/variables.yml" \
  -d ci0
