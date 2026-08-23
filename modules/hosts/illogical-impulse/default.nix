{ self, inputs, lib, ... }:

{
    imports = [
        ../../options.nix
    ];

    config.flake = {
        nixosConfigurations.illogical-impulse = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                {
                    nixpkgs = {
                        overlays = [
                            self.overlays.neo-zen
                            self.overlays.wallpapers
                            self.overlays.pfps
                            self.overlays.gnome-adwaita
                        ];

                        config.allowUnfree = true;
                    };
                }

                self.nixosModules.illogical-impulseConfiguration
            ];
        };
    };
}
