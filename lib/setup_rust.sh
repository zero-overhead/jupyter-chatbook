#!/bin/bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
source $LIB_DIR/global_settings.sh

#######################################
## Setup Rustup
#######################################

rustup-init -y

# install jupyter rust kernel
cargo install evcxr_jupyter
evcxr_jupyter --install

echo "see jupyter rust kernel examples at:"
echo "https://github.com/evcxr/evcxr/blob/main/evcxr_jupyter/samples/evcxr_jupyter_tour.ipynb"

# uninstall jupyter rust kernel
#evcxr_jupyter --uninstall
#cargo uninstall evcxr_jupyter
