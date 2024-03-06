#!/usr/bin/env sh
set -eu

find_out_distro() {
   release_txt="$(cat /etc/*-release 2> /dev/null)"

   if echo "$release_txt" | grep "Ubuntu" > /dev/null; then
      echo "ubuntu"
   else
      # TODO: support other distro
      echo "unknown"
      echo "$0: cannot find out distro name" >&2
   fi
}

