#!/bin/sh

set -e
set -o pipefail

filename=`find ~/Desktop -name "Screenshot*" | sort | tail -n 1`
echo $filename
mv "${filename}" .
