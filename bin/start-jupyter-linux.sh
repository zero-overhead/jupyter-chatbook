#!/bin/bash
DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
CONF_DIR=$DIR/../conf

# execute generic config script
source $LIB_DIR/config.sh $1

echo Executing: nix-shell --pure --run 'jupyter $GUI $BROWSER --notebook-dir=\"$WORK_DIR\"' $RES_DIR/nix-setup.nix
echo " "
echo " "
nix-shell --pure --run 'jupyter $GUI $BROWSER --notebook-dir="$WORK_DIR"' $RES_DIR/nix-setup.nix