#!/usr/bin/env sh
set -eu

. "$module_dir"/header.sh

confirm_install() {
   printf "$(header prompt) Do you want to install $1? [Y/N]: "
   read _response
   case "$_response" in
      [yY]*) install_$1 ;;
      *) echo "$(header info) Skip installing $1." ;;
   esac
}
