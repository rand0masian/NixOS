{ self, inputs, lib, ... }:

{
    imports = [
        ../../options.nix
    ];

    config.flake = {
        nixosConfigurations.caelestia = inputs.nixpkgs.lib.nixosSystem {
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

                self.nixosModules.caelestiaConfiguration
            ];
        };
    };
}
