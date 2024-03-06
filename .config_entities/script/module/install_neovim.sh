#!/usr/bin/env sh
set -eu

install_neovim() {
   if which apt > /dev/null; then
      sudo apt install -y software-properties-common
      sudo add-apt-repository -y ppa:neovim-ppa/unstable
      sudo apt update
      sudo apt install -y neovim
      return $?
   fi

   # TODO: support other distro

   echo "$0: unsupported distro" >&2
   return 1
}
