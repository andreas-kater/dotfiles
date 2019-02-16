#!/bin/sh

set -e
set -o pipefail

echo $1
cmd="ls -al"
gcm="gcm $1"
#$cmd
$gcm
echo "ran gcmp"

#gcm
#gl
