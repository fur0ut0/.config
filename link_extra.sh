#!/usr/bin/env bash
set -eu

script_root="$(cd $(dirname "$0"); pwd)"

declare -A link_pairs=(
   ["$script_root/zsh/.zshenv"]="$HOME/.zshenv"
)

echo "==> Create extra symlinks"

for src in ${!link_pairs[@]}; do
   dst="${link_pairs["$src"]}"
   ln -svf "$src" "$dst"
done

