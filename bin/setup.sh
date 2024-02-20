#!/usr/bin/env bash

DIR=$(dirname "$0")
FULL_PATH=$(dirname `readlink -f $0`)
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
CONF_DIR=$DIR/../conf
source $CONF_DIR/global_settings.sh

echo "Setup System"
source $LIB_DIR/setup_system.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    source $LIB_DIR/setup_all.sh
    jupyter lab --generate-config
else
    nix-shell --run "export FULL_PATH=$FULL_PATH; export LIB_DIR=$LIB_DIR; export PROJECT=$PROJECT; export ENV_DIR=$ENV_DIR; export RES_DIR=$RES_DIR; export CONF_DIR=$CONF_DIR; source $LIB_DIR/setup_all.sh; jupyter lab --generate-config" $DIR/../shell.nix
fi

echo " "
echo "Consider creating an alias by running"
echo "echo \"alias jn=$FULL_PATH/run.sh /path/to/work-dir\" >> \$HOME/.bashrc"
