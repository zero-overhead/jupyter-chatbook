#!/bin/bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
CONF_DIR=$DIR/../conf
source $CONF_DIR/global_settings.sh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "On Linux we use NixOS"
	#sudo apt-get update
	#sudo apt-get install $(cat $DIR/packages-linux.txt)
	bash <(curl -L https://nixos.org/nix/install) --daemon
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "On Mac we use Brew"
	if ! command -v brew &> /dev/null; then
	    echo "Installing https://brew.sh"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	brew install $(cat $CONF_DIR/packages-mac.txt)
else
    echo "On Windows please use https://www.virtualbox.org/ or WSL (Windows Subsystem for Linux)"
    echo "in order to get a local Linux - inside we going to run Jupyter."
    echo "Choose any distribution you like and run this script again from inside Linux."
fi
