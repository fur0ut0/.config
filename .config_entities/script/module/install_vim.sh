#!/usr/bin/env sh
set -eu

install_vim() {
   if which apt > /dev/null; then
      sudo apt update
      sudo apt install -y vim
   fi
   if which git > /dev/null; then
      pack_dir="${XDG_DATA_HOME:-$HOME/.local/share}"/vim/pack
      mkdir -p "$pack_dir"/vendor/start
      git clone https://tpope.io/vim/surround.git "$pack_dir"/vendor/start/surround
      git clone https://tpope.io/vim/repeat.git "$pack_dir"/vendor/start/repeat
      git clone https://github.com/bronson/vim-visual-star-search "$pack_dir"/vendor/start/visual-star-search
      return $?
   fi

   # TODO: support other distro

   echo "$0: unsupported distro" >&2
   return 1
}
