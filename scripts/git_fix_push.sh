#!/bin/sh

set -e
set -o pipefail

editor=$EDITOR

git add .
git commit --fixup HEAD

export EDITOR="true"
git rebase -i --autosquash HEAD~2
export EDITOR=editor


git push -f

git --no-pager log --oneline --decorate --graph --all -n 20
