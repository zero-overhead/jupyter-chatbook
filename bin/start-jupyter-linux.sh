#!/bin/bash
DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources

# execute generic config script
source $LIB_DIR/config.sh $1

RUN_JUPYTER=="nix-shell --pure --run 'jupyter $GUI --browser=firefox --notebook-dir=\"$WORK_DIR\"' $RES_DIR/nix-setup.nix"
echo Executing: $RUN_JUPYTER
echo " "
echo " "
$RUN_JUPYTER