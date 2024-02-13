#!/bin/bash

DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
source $LIB_DIR/global_settings.sh

if test ! $# == 0; then 
  API_FILE=$1
else
  API_FILE=$DEFAULT_API_FILE
fi

echo "Appending API KEYS to $API_FILE"
read -p "OPENAI_API_KEY: " OPENAI_API_KEY
read -p "MISTRAL_API_KEY: " MISTRAL_API_KEY
echo "OPENAI_API_KEY=$OPENAI_API_KEY" >> $API_FILE
echo "MISTRAL_API_KEY=$MISTRAL_API_KEY" >> $API_FILE
