{ self, inputs, ... }:

{
    flake.overlays = {
        neo-zen = final: prev: {
            neo-zen = final.callPackage ({ stdenv }: stdenv.mkDerivation {
                pname = "neo-zen";
                version = "latest";
                src = inputs.neo-zen;
                installPhase = ''
                    mkdir -p $out/share/neo-zen
                    cp -r . $out/share/neo-zen/
                '';
            }) {};
        };
    };

    perSystem = { config, pkgs, ... }:
        {
            packages.neo-zen = pkgs.neo-zen;
        };
}
