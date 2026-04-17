{ self, inputs, ... }:

{
    flake.nixosModules = {
        niri = { config, ... }:
            {
                programs.niri = {
                    enable = true;
                };
            };
    };
}
