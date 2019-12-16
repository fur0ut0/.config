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

echo "==> Bind colorscheme packages"

declare -a repos_names=(
   float168/vim-colors-halogen-light
)

nvim_color_dir="$script_root/nvim/colors"
mkdir -p "$nvim_color_dir"
for repos_name in ${repos_names[@]}; do
   dirname="$(basename $repos_name .git)"
   if [[ ! -e "$nvim_color_dir/$dirname" ]]; then
      yes | ssh -T git@github.com > /dev/null 2>&1
      if [[ $? == 1 ]]; then
         url="git@github.com:$repos_name"
      else
         url="https://github.com/$repos_name"
      fi
      git clone "$url" "$nvim_color_dir/$dirname" -b develop
   fi
   for colorscheme in "$nvim_color_dir/$dirname/colors"/*.vim; do
      ln -sfv "$colorscheme" "$nvim_color_dir/$(basename $colorscheme)"
   done
done

