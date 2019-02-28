#!/bin/sh

set -e
set -o pipefail

git fetch
git checkout master
git pull origin master
prefix="andi-"
git checkout -b "$prefix$1"
git --no-pager log --oneline --decorate --graph --all -n 20
