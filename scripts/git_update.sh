#!/bin/sh

set -e
set -o pipefail

git fetch
git checkout master
git pull origin master
git --no-pager log --oneline --decorate --graph --all -n 20
