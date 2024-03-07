#!/usr/bin/env sh
set -eu

this_dir="$(cd "$(dirname "$0")"; pwd)"
module_dir="$this_dir"/.config_entities/script/module

. "$module_dir"/header.sh

# Create links to entities
timestamp="$(date +%Y%m%dT%H%M%S)"
backup_dir=backup/"$timestamp"
for d in .config_entities/*; do
   dst="$this_dir/$(basename "$d")"
   if [ -e "$dst" ] && [ ! -L "$dst" ]; then
      # Backup existing one
      mkdir -p "$backup_dir"
      mv -vb "$dst" "$backup_dir"
   fi
   ln -vsfnr "$d" "$this_dir"
done

# Configure git local config
git_local_config="$this_dir"/git/local/config
if [ ! -e "$git_local_config" ]; then
   echo "$(header info) Configure git local config"
   echo -n "$(header prompt) Enter your user.name: "
   read _name
   echo -n "$(header prompt) Enter your user.email: "
   read _email
   echo """[user]
   name = $_name
   email = $_email""" >> "$git_local_config"
   echo "$(header info) Configured git local config:"
   cat "$git_local_config"
fi
