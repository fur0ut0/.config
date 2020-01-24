#!/usr/bin/env bash
set -eu

if [[ ! "$(lsb_release -a 2>/dev/null)" =~ Ubuntu ]]; then
   echo "Not Ubuntu, abort" 2> /dev/null
   exit 1
fi

setup_python_dependencies() {
   # Python3
   sudo apt install -y libreadline-dev libncursesw5-dev libssl-dev \
      libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev zlib1g-dev uuid-dev \
      libffi-dev libdb-dev
   # Python2
   sudo apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev \
      libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
}

setup_ruby_dependencies() {
   sudo apt-get install -y autoconf bison build-essential libssl-dev \
      libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev \
      libgdbm5 libgdbm-dev
}

#------------------------------------------------------------------------------
# Main

setup_python_dependencies
setup_ruby_dependencies

./ubuntu/wm_keybind.zsh

