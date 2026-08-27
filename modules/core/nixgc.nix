{ self, inputs, ... }:

{
    flake.nixosModules = {
        nixgc = { config, ... }:
            {
                nix.gc = {
                    automatic = true;
                    dates = "daily";
                    options = "--delete-older-than 3d";
                };
            };
    };
}
