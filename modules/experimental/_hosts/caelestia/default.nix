{ self, inputs, ... }:

{
    flake.nixosConfigurations = {
        caelestia = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit self inputs; };

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

                ./configuration.nix
                self.nixosModules.experimental
            ];
        };
    };
}
