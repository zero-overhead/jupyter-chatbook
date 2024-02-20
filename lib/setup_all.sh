echo "Setup Juypter"
source $LIB_DIR/setup_jupyter.sh
source $ENV_DIR/$PROJECT/bin/activate
echo "Setup Raku"
source $LIB_DIR/setup_raku.sh
echo "Setup Rust"
source $LIB_DIR/setup_rust.sh
echo "Setup AI Keys"
source $LIB_DIR/setup_AI.sh "$ENV_DIR/$PROJECT/.env"
