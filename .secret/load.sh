#!/bin/bash -eux

filename="${1:-.secret/ball.tgz}"

pushd $REPO_ROOT
  tar xvf $filename
popd
