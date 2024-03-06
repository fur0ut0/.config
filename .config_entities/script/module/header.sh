#!/usr/bin/env sh
set -eu

header() {
   h="[$(echo "$1" | tr '[:lower:]' '[:upper:]')]"
   printf '%-9s' "$h"
}
