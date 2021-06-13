#!/bin/bash
set -e
set -x

#virtualenv -p python3 .
#source ./bin/activate

pip install -r requirements.txt
pip install -e .
python -m bigg.unit_test.lib_test