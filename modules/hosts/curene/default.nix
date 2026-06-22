{ self, inputs, lib, ... }:

{
    imports = [
        ../../options.nix
    ];

    config.flake = {
        nixosConfigurations.curene = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                {
                    nixpkgs = {
                        overlays = [
                            self.overlays.neo-zen
                            self.overlays.wallpapers
                            self.overlays.pfps
                        ];

                        config.allowUnfree = true;
                    };
                }

                self.nixosModules.cureneConfiguration
            ];
        };
    };
}
