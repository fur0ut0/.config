#/usr/bin/env zsh
set -eu
setopt NOSH_WORD_SPLIT

if [[ ! $(uname -a) =~ Ubuntu ]]; then
   print -u 2 -- "Not Ubuntu environment, abort"
   exit 1
fi

local -A maps=(
   switch-to-workspace-left  "['<Super><Control>Left']"
   switch-to-workspace-right "['<Super><Control>Right']"
   switch-to-workspace-up    "['<Super><Control>Up']"
   switch-to-workspace-down  "['<Super><Control>Down']"
   move-to-workspace-left    "['<Super><Control><Shift>Left']"
   move-to-workspace-right   "['<Super><Control><Shift>Right']"
   move-to-workspace-up      "['<Super><Control><Shift>Up']"
   move-to-workspace-down    "['<Super><Control><Shift>Down']"
)

for key value in ${(kv)maps}; do
   local cmd="gsettings set org.gnome.desktop.wm.keybindings $key \"$value\""
   echo $cmd
   eval $cmd
done
