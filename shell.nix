with (import <nixpkgs> {});

# TODO: LD_LIBRARY_PATH via ripgrep + raku-script takes a long time - do it the NixOS way ...
let

    envShellHooks = ''
        export ZEF_FETCH_DEGREE=4
        export ZEF_TEST_DEGREE=1
        export PATH=$HOME/.raku/bin:$PATH
        export LD_LIBRARY_PATH=`rg -g '*libssl.so*' -g '*libzmq.so*' -g '*zlib.so*' -g '*libstdc++.so*' --files /nix/store/ | raku -e 'say lines.map( { / (\/nix\/store\/.*\/lib) \/ /; $0 } ).unique.join(":")'`:$LD_LIBRARY_PATH
        ''
    ;

    basePackages = [
        stdenv
        firefox
        
        nodejs
        python311
        python311Packages.pip

        rakudo
        zef
        zlib
        openssl        
        zeromq

        jdk
        gcc
        rustup
        rustc
        cargo
        
        git
        curl
        wget
        cacert
        
        ripgrep
        imagemagick
        pandoc
    ];

in mkShell {
  buildInputs = basePackages;
  shellHook = envShellHooks;
}
