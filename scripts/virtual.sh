#!/bin/sh

set -e
set -o pipefail

foldername="venv"

if ! [ -d "${foldername}" ]; then 
    python3 -m venv "${foldername}" 
fi

source "${foldername}"/bin/activate
pip install --upgrade pip
python -m pip install -U autopep8
python -m pip install -U pylint
echo venv >> .gitignore
echo "which python:"
which python
echo ""
echo "done"
