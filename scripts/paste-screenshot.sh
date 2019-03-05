#!/bin/sh

set -e
set -o pipefail

filename=`find ~/Desktop -name "Screenshot*" | sort | tail -n 1`

if [[ -z $1 ]]; then
  mv "${filename}" .
else
  if [ -f $1 ]; then
    rm "$1"
  fi
  mv "${filename}" "$1"
fi
