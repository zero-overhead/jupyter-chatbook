#!/usr/bin/env bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
CONF_DIR=$DIR/../conf

# execute generic config script
source $LIB_DIR/load_config.sh $1

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo Executing: jupyter lab $BROWSER --notebook-dir=\"$WORK_DIR\"
    jupyter --paths
    jupyter lab $BROWSER --notebook-dir="$WORK_DIR"
else
    echo "Executing: nix-shell --pure $DIR/../shell.nix --run 'source $ENV_DIR/$PROJECT/bin/activate; jupyter --paths; jupyter lab $BROWSER --notebook-dir=\"$WORK_DIR\"'"
    nix-shell --pure $DIR/../shell.nix --run "source $ENV_DIR/$PROJECT/bin/activate; jupyter --paths; jupyter lab $BROWSER --notebook-dir=\"$WORK_DIR\""
fi
