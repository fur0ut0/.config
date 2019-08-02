#!/usr/bin/env bash
set -eu

if [[ ! "$(uname -s)" =~ 'Linux*' ]]; then
   echo "Not Linux, abort" 2> /dev/null
   exit 1
fi

