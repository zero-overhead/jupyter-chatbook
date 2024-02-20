#!/usr/bin/env bash

THISENV=$ENV_DIR/$PROJECT

mkdir -p $ENV_DIR

python3 -m venv $THISENV
source $THISENV/bin/activate
python3 -m ensurepip --default-pip
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install -r $CONF_DIR/packages-jupyter.txt
