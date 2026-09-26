{ self, inputs, ... }:

{
    flake.overlays = {
        wallpapers = final: prev: {
            wallpapers = final.callPackage ({ stdenv }: stdenv.mkDerivation {
                pname = "wallpapers";
                version = "latest";
                src = inputs.wallpapers;
                installPhase = ''
                    mkdir -p $out/share/wallpapers
                    cp -r . $out/share/wallpapers/
                '';
            }) {};
        };
    };

    perSystem = { config, pkgs, ... }:
        {
            packages.wallpapers = pkgs.wallpapers;
        };
}
