#!/usr/bin/env bash
set -eu

script_root="$(cd $(dirname "$0"); pwd)"

if [[ ! "$(uname -s)" =~ Linux ]]; then
   echo "Not Linux, abort" 2> /dev/null
   exit 1
fi

if [[ "$(lsb_release -a 2>/dev/null)" =~ Ubuntu ]]; then
   "${script_root}/ubuntu_setup.sh"
fi

