{ self, inputs, ... }:

{
    flake.overlays = {
        pfps = final: prev: {
            pfps = final.callPackage ({ pkgs }: pkgs.stdenvNoCC.mkDerivation {
                pname = "pfps";
                version = "latest";
                src = ../../assets/pfps;
                installPhase = ''
                    mkdir -p $out/share/pfps
                    cp -r . $out/share/pfps/
                '';
            }) {};
        };
    };

    perSystem = { config, pkgs, ... }:
        {
            packages.pfps = pkgs.pfps;
        };
}
