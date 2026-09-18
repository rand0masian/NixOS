{ config, pkgs, lib, ... }:

{
    imports = [
        ../../../options.nix
    ];

    config = lib.mkIf config.features.experimental.enable {
        flake.nixosConfigurations = {
            calestia = inputs.nixpkgs.lib.nixosSystem {
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

                    ./configuration.nix
                ];
            };
        };
    };
}
