#!/usr/bin/env bash
set -eu

if [[ ! "$(uname -s)" =~ Darwin ]]; then
   echo "Not macOS, abort" 2> /dev/null
   exit 1
fi

