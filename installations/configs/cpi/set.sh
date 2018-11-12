#!/bin/bash -eux

this_dir="${REPO_ROOT}/installations/configs/cpi"
bbl_vars_dir="${REPO_ROOT}/installations/bbl/vars"

bosh update-config "${this_dir}/docker.yml" \
  --type cpi \
  --name docker \
  --vars-file "${bbl_vars_dir}/director-vars-file.yml" \
  --vars-file "${bbl_vars_dir}/director-vars-store.yml" \
  --vars-file "${this_dir}/variables.yml"
