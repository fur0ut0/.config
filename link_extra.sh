#!/usr/bin/env bash
set -eu

script_root="$(cd $(dirname "$0"); pwd)"

# 古いbashでは連想配列がない
# そこでただの配列で代用する
declare -a src_dst_pairs=(
   "zsh/.zshenv" ".zshenv"
)
if (( ${#src_dst_pairs[@]} % 2 != 0 )); then
   echo "Implementation error on pairs array" >&2
   exit 1
fi

echo "==> Create extra symlinks"

for ((i = 0; i < ${#src_dst_pairs[@]}; i += 2)); do
   src="$script_root/${src_dst_pairs[$i]}"
   dst="$HOME/${src_dst_pairs[$(($i + 1))]}"
   ln -svf "$src" "$dst"
done

