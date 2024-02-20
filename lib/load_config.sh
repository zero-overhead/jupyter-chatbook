#!/usr/bin/env bash

source $CONF_DIR/global_settings.sh

echo "Python environment: $ENV_DIR/$PROJECT"
source $ENV_DIR/$PROJECT/bin/activate

if test ! $# == 0; then 
  export WORK_DIR=$1
else
  export WORK_DIR=$DEFAULT_WORK_DIR
fi

mkdir -p $WORK_DIR
echo "Working directory: $WORK_DIR"

#SHOW_PATHS="jupyter --paths"
#echo executing: $SHOW_PATHS
#$SHOW_PATHS
#echo " "

# we need API keys, looking in .env files
if test -f "$WORK_DIR/.env"; then
  #echo ".env file in $WORK_DIR"
  API_KEYS_FILE=$WORK_DIR/.env
else
  #echo "No .env file in $WORK_DIR"
  if test -f "$HOME/.env"; then
    #echo ".env file in $HOME"
    API_KEYS_FILE=$HOME/.env
  else
    #echo "No .env file in $HOME"
    if test -f "$ENV_DIR/$PROJECT/.env"; then
      #echo ".env file in $ENV_DIR/$PROJECT"
  		API_KEYS_FILE="$ENV_DIR/$PROJECT/.env"
  	else
      #echo "No .env file in $ENV_DIR/$PROJECT"
      source $LIB_DIR/setup_AI.sh "$WORK_DIR/.env"
      API_KEYS_FILE="$WORK_DIR/.env"
    fi
  fi
fi

echo "API keys: $API_KEYS_FILE"
set -a # automatically export all variables
source $API_KEYS_FILE
set +a

if test ! $OPENAI_API_KEY -o ! $MISTRAL_API_KEY -o ! PALM_API_KEY; then
    echo "Specify at least one of OPENAI_API_KEY MISTRAL_API_KEY or PALM_API_KEY"
    exit
fi
