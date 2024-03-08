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
   else
      # TODO: use other methods to download repository
      echo "$0: git not found" >&2
      return 1
   fi

   # Install packages to build python
   # FIY: https://github.com/pyenv/pyenv/wiki#troubleshooting--faq
   if which apt > /dev/null; then
      sudo apt update
      sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
         libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev \
         libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
   else
      # TODO: support other distro
      echo "$0: unsupported distro" >&2
      return 1
   fi
}
