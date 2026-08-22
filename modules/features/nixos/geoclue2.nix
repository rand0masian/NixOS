{ self, inputs, ... }:

{
    flake.nixosModules = {
        geoclue2 = { config, ... }:
            {
                services.geoclue2 = {
                    enable = true;
                };
            };
    };
}
