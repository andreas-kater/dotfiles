#!/bin/sh

set -e
set -o pipefail

echo running: zip -er "$1" "$1" -P "$2"
zip -er "$1" "$1" -P "$2"
