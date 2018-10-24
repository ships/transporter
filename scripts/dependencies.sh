#!/usr/bin/env bash -eux

transporter_root="$( cd "$(dirname $0)/.." && pwd )"

set +e
  pushd $transporter_root
    if [ -z "$(which brew)" ]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
  popd
set -e

brew bundle -v
direnv allow
