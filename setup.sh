#/usr/bin/env bash
set -eu

script_root="$(cd $(dirname "$0"); pwd)"

export XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"

setup_pyenv() {
   mkdir -p "$XDG_DATA_HOME"
   cd "$XDG_DATA_HOME"
   git clone https://github.com/pyenv/pyenv
   cd pyenv/plugins
   git clone https://github.com/pyenv/pyenv-virtualenv
}

setup_rbenv() {
   mkdir -p "$XDG_DATA_HOME"
   cd "$XDG_DATA_HOME"
   git clone https://github.com/rbenv/rbenv
   mkdir -p rbenv/plugins
   cd rbenv/plugins
   git clone https://github.com/rbenv/ruby-build
}

confirm_setup() {
   local name=$1
   echo "Do you want to setup $name?: "
   local response
   read response
   case "$response" in
      [yY]*) eval setup_$name ;;
      *) ;;
   esac
}

#------------------------------------------------------------------------------
# Main

case "$(uname -s )" in
   Darwin*) "$script_root/.init/macos_setup.sh" ;;
   Linux*)  "$script_root/.init/linux_setup.sh" ;;
esac

if ! which pyenv > /dev/null 2>&1; then
   confirm_setup pyenv
fi

if ! which rbenv > /dev/null 2>&1; then
   confirm_setup rbenv
fi

