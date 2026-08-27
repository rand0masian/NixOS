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

    perSystem = { config, system, ... }:
        {
            _module.args = {
                pkgs = import inputs.nixpkgs {
                    inherit system;
                    overlays = [
                        self.overlays.wallpapers
                    ];

                    config.allowUnfree = true;
                };
            };

            packages.wallpapers = config._module.args.pkgs.wallpapers;
        };
}
