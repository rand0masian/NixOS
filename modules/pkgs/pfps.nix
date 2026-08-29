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
