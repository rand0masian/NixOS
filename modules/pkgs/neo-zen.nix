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

    perSystem = { config, system, ... }:
        {
            _module.args = {
                pkgs = import inputs.nixpkgs {
                    inherit system;
                    overlays = [
                        self.overlays.neo-zen
                    ];

                    config.allowUnfree = true;
                };
            };

            packages.neo-zen = config._module.args.pkgs.neo-zen;
        };
}
