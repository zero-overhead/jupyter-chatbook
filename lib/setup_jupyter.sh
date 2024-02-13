#!/bin/bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources

#######################################
## Setup Jupyter
#######################################
source $LIB_DIR/global_settings.sh
THISENV=$ENV_DIR/$PROJECT

mkdir -p $ENV_DIR

python3 -m venv $THISENV
source $THISENV/bin/activate
python3 -m ensurepip --default-pip
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install -r $DIR/../resources/packages-jupyter.txt

jupyter lab --generate-config
jupyter notebook --generate-config