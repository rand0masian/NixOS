{ self, inputs, ... }:

{
    flake.nixosModules = {
        dconf = { config, ... }:
            {
                programs.dconf = {
                    enable = true;
                };
            };
    };
}
