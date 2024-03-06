#!/usr/bin/env sh
set -eu

install_neovim_one() {
   if which git > /dev/null; then
      XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
      PACK_DIR="$XDG_DATA_HOME"/nvim/site/pack/user/start
      mkdir -p "$PACK_DIR"
      cd "$PACK_DIR"
      git clone --depth 1 --single-branch https://github.com/adoyle-h/one.nvim.git "$PACK_DIR"/one.nvim
      return $?
   fi

   # TODO: use other methods to download repository

   echo "$0: git not found" >&2
   return 1
}
