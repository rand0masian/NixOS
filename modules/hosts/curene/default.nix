{ self, inputs, lib, ... }:

{
    imports = [
        ../../options.nix
    ];

    config.flake = {
        nixosConfigurations.curene = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                self.nixosModules.cureneConfiguration
            ];
        };
    };
}
