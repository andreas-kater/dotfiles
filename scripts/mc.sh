#!/bin/sh

set -e
set -o pipefail

if [ -d "$1" ]; then 
  cd "$1"
  if [ -L "$1" ]; then
    echo "there is already a symlink named $1"
  else
    echo "there is already a directory named $1"
  fi
else
  mkdir $1
  cd $1
  exec zsh
fi

