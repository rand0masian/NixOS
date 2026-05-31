{ self, inputs, ... }:

{
    flake.nixosModules = {
        allowUnfree = { config, ... }:
            {
                nixpkgs.config = {
                    allowUnfree = true;
                };
            };
    };
}
