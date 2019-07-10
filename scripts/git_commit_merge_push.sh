#!/bin/sh

set -e
set -o pipefail

git add .
git commit -m "$1"
git push origin master
git --no-pager log --oneline --decorate --graph --all -n 12
