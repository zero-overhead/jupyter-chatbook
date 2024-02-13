#!/bin/bash
DIR=$(dirname "$0")
LIB_DIR=$DIR/../lib
RES_DIR=$DIR/../resources
source $LIB_DIR/global_settings.sh

#######################################
## Setup Raku Chatbook
#######################################

KERNELPATH=$ENV_DIR/$PROJECT/share/jupyter/kernels

# do fetch and test parallel
ZEF_FETCH_DEGREE=4
#ZEF_TEST_DEGREE=4

#                                                     match YYYY.MM as Raku version
RAKUVERSION=`raku --version | raku -e 'put $*IN.slurp ~~ / \d**4 \. \d**2 /'`
RAKUPATH=/usr/local/Cellar/rakudo-star/$RAKUVERSION/share/perl6/site/bin
echo Using Rakudo v$RAKUVERSION installed in
echo $RAKUPATH

if [[ "$SHELL" == *"zsh"* ]]; then

  #echo "#####"
  #echo oh-my-zsh user please execute:
  #echo "echo \"export PATH=\\\$PATH:$RAKUPATH\" >> \$ZSH_CUSTOM/my_path.zsh"
  #echo "echo \"export RAKUDO_RAKUAST=1\" >> \$ZSH_CUSTOM/my_raku.zsh"
  #echo "echo \"unset RAKUDO_RAKUAST\" >> \$ZSH_CUSTOM/my_raku.zsh"

  echo "#####"
  
  echo "export PATH=\$PATH:$RAKUPATH" >> ~/.zshrc

elif [[ "$SHELL" == *"bash"* ]]; then
  echo "export PATH=\$PATH:$RAKUPATH" >> ~/.bashrc
fi

PATH=$PATH:$RAKUPATH

zef install $(cat $RES_DIR/packages-raku.txt)

# https://jupyter-client.readthedocs.io/en/latest/kernels.html#kernelspecs

jupyter-chatbook.raku --generate-config --location="$KERNELPATH/chatbook" --force

#jupyter-kernel.raku --generate-config --location="$KERNELPATH/raku" --force

# Lokalisierung: https://github.com/rcmlz/rakudo/blob/main/lib/L10N/DE.rakumod

# use colored Raku logos
cp $RES_DIR/logo-*.png "$KERNELPATH/chatbook/"
