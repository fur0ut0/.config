#!/usr/bin/env sh
set -eu

this_dir="$(cd "$(dirname "$0")"; pwd)"
module_dir="$this_dir"/.config_entities/script/module

. "$module_dir"/find_out_distro.sh
. "$module_dir"/confirm_install.sh
. "$module_dir"/install_fish.sh
. "$module_dir"/install_fzf.sh
. "$module_dir"/install_luarocks.sh
. "$module_dir"/install_neovim.sh
. "$module_dir"/install_neovim_one.sh
. "$module_dir"/install_pyenv.sh
. "$module_dir"/install_ripgrep.sh

which fish > /dev/null || confirm_install fish
which fzf > /dev/null || confirm_install fzf
which luarocks > /dev/null || confirm_install luarocks
which nvim > /dev/null || confirm_install neovim
[ -d "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/user/start ] || confirm_install neovim_one
which pyenv > /dev/null || confirm_install pyenv
which rg > /dev/null || confirm_install ripgrep
