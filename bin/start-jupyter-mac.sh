#!/bin/bash
DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
CONF_DIR=$DIR/../conf

# execute generic config script
source $LIB_DIR/load_config.sh $1

echo Executing: jupyter $GUI $BROWSER --notebook-dir=\"$WORK_DIR\"
echo " "
echo " "
jupyter $GUI $BROWSER --notebook-dir="$WORK_DIR"
