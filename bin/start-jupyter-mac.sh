#!/bin/bash
DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources

# execute generic config script
source $LIB_DIR/load_config.sh $1

RUN_JUPYTER="jupyter $GUI --browser=firefox --notebook-dir=\"$WORK_DIR\""
echo Executing: $RUN_JUPYTER
echo " "
echo " "
$RUN_JUPYTER
