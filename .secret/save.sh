#!/bin/bash -eux

filename="${1:-.secret/ball.tgz}"

pushd $REPO_ROOT
  cat .secret/files | xargs tar -czf $filename
popd
