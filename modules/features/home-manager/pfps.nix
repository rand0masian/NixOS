{ self, inputs, ... }:

{
    flake.overlays = {
        pfps = final: prev: {
            pfps = final.callPackage ({ stdenv }: stdenv.mkDerivation {
                pname = "pfps";
                version = "latest";
                srcs = [
                    inputs.pfp01
                    inputs.pfp02
                    inputs.pfp03
                    inputs.pfp04
                    inputs.pfp05
                    inputs.pfp06
                ];

                dontUnpack = true;
                sourceRoot = ".";
                installPhase = ''
                    mkdir -p $out/share/pfps
                    sources=($srcs)
                    cp "''${sources[0]}" $out/share/pfps/darkemo.webp
                    cp "''${sources[1]}" $out/share/pfps/exhaustedselfie.jpg
                    cp "''${sources[2]}" $out/share/pfps/catgirlangel.jpg
                    cp "''${sources[3]}" $out/share/pfps/darkglassesgoth.jpg
                    cp "''${sources[4]}" $out/share/pfps/yanderegoth.jpg
                    cp "''${sources[5]}" $out/share/pfps/blackandwhite.jpg
                '';
            }) {};
        };
    };

    perSystem = { config, system, ... }:
        {
            _module.args = {
                pkgs = import inputs.nixpkgs {
                    inherit system;
                    overlays = [
                        self.overlays.pfps
                    ];

                    config.allowUnfree = true;
                };
            };

            packages.pfps = config._module.args.pkgs.pfps;
        };
}
