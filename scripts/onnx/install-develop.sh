#!/bin/bash

set -ex

# realpath might not be available on MacOS
script_path=$(python -c "import os; import sys; print(os.path.realpath(sys.argv[1]))" "${BASH_SOURCE[0]}")
top_dir=$(dirname $(dirname $(dirname "$script_path")))
tp2_dir="$top_dir/third_party"

pip install --index-url 'https://:2022-12-15T20:15:37.432001Z@time-machines-pypi.sealsecurity.io/' ninja

# Install onnx
pip install --index-url 'https://:2022-12-15T20:15:37.432001Z@time-machines-pypi.sealsecurity.io/' --no-use-pep517 -e "$tp2_dir/onnx"

# Install caffe2 and pytorch
pip install --index-url 'https://:2022-12-15T20:15:37.432001Z@time-machines-pypi.sealsecurity.io/' -r "$top_dir/caffe2/requirements.txt"
pip install --index-url 'https://:2022-12-15T20:15:37.432001Z@time-machines-pypi.sealsecurity.io/' -r "$top_dir/requirements.txt"
python setup.py develop
