#!/bin/sh

set -e
set -o pipefail

echo "git push"
git push

echo "git pull-request -c"
git pull-request -c
