#!/bin/bash

DIR=$(dirname "$0")
FULL_PATH=$(dirname `readlink -f $0`)
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
CONF_DIR=$DIR/../conf
source $CONF_DIR/global_settings.sh

$LIB_DIR/setup_system.sh

THISOS="linux"

if [[ "$OSTYPE" == "darwin"* ]]; then
	THISOS="mac"

	$LIB_DIR/setup_jupyter.sh
	source $ENV_DIR/$PROJECT/bin/activate
	
	$LIB_DIR/setup_raku.sh
	$LIB_DIR/setup_rust.sh
	$LIB_DIR/setup_AI.sh "$ENV_DIR/$PROJECT/.env"
fi

echo " "
echo "Consider creating an alias by running"
echo "echo \"alias jn=$FULL_PATH/start-jupyter-$THISOS.sh /path/to/work-dir\" >> \$ZSH_CUSTOM/my_alias.zsh"
echo " "
echo "or if you are using bash"
echo "echo \"alias jn=$FULL_PATH/start-jupyter-$THISOS.sh /path/to/work-dir\" >> \$HOME/.bashrc"
echo " "
