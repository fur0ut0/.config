#!/usr/bin/env sh
set -eu

install_fish() {
   if which apt > /dev/null; then
      sudo apt install -y software-properties-common
      sudo add-apt-repository -y ppa:fish-shell/release-3
      sudo apt update
      sudo apt install -y fish
      return $?
   fi

   # TODO: support other distro

   echo "$0: unsupported distro" >&2
   return 1
}
