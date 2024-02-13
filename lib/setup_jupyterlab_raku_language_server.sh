#!/bin/bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources

#######################################
## Setup Raku Chatbook
#######################################

source $LIB_DIR/global_settings.sh
LSPATH=$HOME/.raku
THISENV=$ENV_DIR/$PROJECT

source $THISENV/bin/activate

cd $LSPATH
git clone https://github.com/bscan/RakuNavigator
cd RakuNavigator
npm install
npm run compile

echo "node $LSPATH/RakuNavigator/server/out/server.js --stdio"
echo "change path in raku-language-server-implementation.json and then execute"
echo "cp raku-language-server-implementation.json $ENV_DIR/etc/jupyter/jupyter_server_config.d/"