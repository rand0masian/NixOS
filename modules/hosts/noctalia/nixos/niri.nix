{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaNiri = { config, ... }:
            {
                programs.niri = {
                    enable = true;
                };
            };
    };
}
