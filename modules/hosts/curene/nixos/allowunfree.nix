{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneAllowunfree = { config, ... }:
            {
                nixpkgs.config = {
                    allowUnfree = true;
                };
            };
    };
}
