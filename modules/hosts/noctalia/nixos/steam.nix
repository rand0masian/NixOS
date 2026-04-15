{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaSteam = { config, ... }:
            {
                programs.steam = {
                    enable = true;
                };
            };
    };
}
