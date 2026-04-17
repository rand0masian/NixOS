{ self, inputs, ... }:

{
    flake.nixosModules = {
        steam = { config, ... }:
            {
                programs.steam = {
                    enable = true;
                };
            };
    };
}
