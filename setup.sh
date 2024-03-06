#!/usr/bin/env sh
set -eu

this_dir="$(cd "$(dirname "$0")"; pwd)"
module_dir="$this_dir"/.config_entities/script/module

. "$module_dir"/find_out_distro.sh
. "$module_dir"/confirm_install.sh
. "$module_dir"/install_fish.sh
. "$module_dir"/install_fzf.sh
. "$module_dir"/install_neovim.sh
. "$module_dir"/install_pyenv.sh

confirm_install fish
confirm_install fzf
confirm_install neovim
confirm_install pyenv
