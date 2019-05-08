#!/bin/sh

set -e
set -o pipefail

if [ -z "$1" ]
then
  git --no-pager log --oneline --decorate --graph --all -n 12
else
  git --no-pager log --oneline --decorate --graph --all -n $1
fi


