#/usr/bin/env sh
set -eu

install_pyenv() {
   if which git > /dev/null; then
      export XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
      mkdir -p "$XDG_DATA_HOME"
      cd "$XDG_DATA_HOME"
      git clone https://github.com/pyenv/pyenv
      cd pyenv/plugins
      git clone https://github.com/pyenv/pyenv-virtualenv
      return $?
   fi

   # TODO: use other methods to download repository

   echo "$0: git not found" >&2
   return 1
}
