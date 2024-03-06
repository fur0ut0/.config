#!/usr/bin/env sh
set -eu

install_luarocks() {
   if which apt > /dev/null; then
      sudo apt update
      sudo apt install -y luarocks
      return $?
   fi

   # TODO: support other distro

   echo "$0: unsupported distro" >&2
   return 1
}
