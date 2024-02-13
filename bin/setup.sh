#!/bin/bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources

source $LIB_DIR/global_settings.sh

$LIB_DIR/setup_system.sh

if [[ "$OSTYPE" == "darwin"* ]]; then

	$LIB_DIR/setup_jupyter.sh
	source $ENV_DIR/$PROJECT/bin/activate
	
	$LIB_DIR/setup_raku.sh
	$LIB_DIR/setup_rust.sh
	$LIB_DIR/setup_AI.sh "$ENV_DIR/$PROJECT/.env"

	echo " "
	echo "Consider creating an alias by running"
	echo "echo \"alias jn=/path/to/script/bin/start-jupyter-mac.sh /path/to/work-dir\" >> \$ZSH_CUSTOM/my_alias.zsh"
	echo " "
	echo "or if you are using bash"
	echo "echo \"alias jn=/path/to/script/bin/start-jupyter-mac.sh /path/to/work-dir\" >> \$HOME/.bashrc"
	echo " "
else
	echo " "
	echo "Consider creating an alias by running"
	echo "echo \"alias jn=/path/to/script/bin/start-jupyter-linux.sh /path/to/work-dir\" >> \$ZSH_CUSTOM/my_alias.zsh"
	echo " "
	echo "or if you are using bash"
	echo "echo \"alias jn=/path/to/script/bin/start-jupyter-linux.sh /path/to/work-dir\" >> \$HOME/.bashrc"
	echo " "	
fi
