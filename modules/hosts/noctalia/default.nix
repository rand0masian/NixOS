{ self, inputs, lib, ... }:

{
    options.flake = {
        homeModules = lib.mkOption {
            type = lib.types.lazyAttrsOf lib.types.deferredModule;
            default = {};
        };
    };

    config.flake = {
        nixosConfigurations.noctalia = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                {
                    nixpkgs.overlays = [
                        self.overlays.neo-zen
                        self.overlays.wallpapers
                        self.overlays.pfps
                    ];

                    nixpkgs.config.allowUnfree = true;
                }
                
                self.nixosModules.noctaliaConfiguration
            ];
        };
    };
}
