#!/usr/bin/env sh
set -eu

install_tmux() {
   if which apt > /dev/null; then
      sudo apt update
      sudo apt install -y tmux
   fi
   if which git > /dev/null; then
      plugins_dir="${XDG_DATA_HOME:-$HOME/.local/share}"/tmux/plugins
      mkdir -p "$plugins_dir"
      git clone https://github.com/tmux-plugins/tpm "$plugins_dir"/tpm
      return $?
   fi

   # TODO: support other distro

   echo "$0: unsupported distro" >&2
   return 1
}
