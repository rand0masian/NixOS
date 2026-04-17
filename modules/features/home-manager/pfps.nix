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
                ];

                dontUnpack = true;
                sourceRoot = ".";
                installPhase = ''
                    mkdir -p $out/share/pfps
                    sources=($srcs)
                    cp "''${sources[0]}" $out/share/pfps/darkemo.webp
                    cp "''${sources[1]}" $out/share/pfps/exhaustedselfie.jpg
                    cp "''${sources[2]}" $out/share/pfps/catgirlangel.jpg
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
                        self.overlays.default
                    ];

                    config.allowUnfree = true;
                };
            };

            packages.pfps = config._module.args.pkgs.pfps;
        };
}
