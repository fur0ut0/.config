#/usr/bin/env sh
set -eu

install_pyenv() {
   if which git > /dev/null; then
      XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
      PYENV_ROOT="${PYENV_ROOT:-"$XDG_DATA_HOME/pyenv"}"
      parent="$(dirname "$PYENV_ROOT")"
      mkdir -p "$parent"
      cd "$parent"
      git clone https://github.com/pyenv/pyenv
      cd pyenv/plugins
      git clone https://github.com/pyenv/pyenv-virtualenv
      return $?
   fi

   # TODO: use other methods to download repository

   echo "$0: git not found" >&2
   return 1
}
