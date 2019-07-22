#!/bin/sh

set -e
set -o pipefail

foldername="venv"

if [ -d "${foldername}" ]; then 
    echo "there seems to alredy be a venv in folder ${foldername}"
    exit 1
fi

python3 -m venv "${foldername}" 
source "${foldername}"/bin/activate
pip install --upgrade pip
python -m pip install -U autopep8
echo "which python:"
which python
echo ""
echo "done"
