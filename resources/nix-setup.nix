with (import <nixpkgs> {});

let
    installShellHooks = ''
        export ZEF_FETCH_DEGREE=4
        export ZEF_TEST_DEGREE=4
        zef install Jupyter::Chatbook
        jupyter-chatbook.raku --generate-config 
        ''
    ;

    runShellHooks = ''
        #jupyter --paths
        #mkdir -p .nix-node
        #export NODE_PATH=$PWD/.nix-node
        #export NPM_CONFIG_PREFIX=$PWD/.nix-node
        #export PATH=$NODE_PATH/bin:$PATH
        #alias ll="ls -l"
        #export FOO=bar
        ''
    ;

    jupyter-python-packages = python-packages: with python-packages; [
        jupyter

        pandas
        numpy
        matplotlib

        metakernel

        jupyterlab-lsp
        jedi-language-server # python
    ];
    python-with-jupyter-packages = python3.withPackages jupyter-python-packages;

    basePackages = [
        rakudo
        zef
        moarvm
        nqp

        gcc
        rustup
        openssl

        ripgrep
        git
        curl
        wget

        nodejs
        jupyter-all
    ];

    allPackages = basePackages
    #        ++ lib.optional stdenv.isLinux inotify-tools
    #        ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    #            CoreFoundation
    #            CoreServices])
    ;

    allShellHooks = installShellHooks + runShellHooks;

in mkShell {
  buildInputs = allPackages;
  shellHook = allShellHooks;
}