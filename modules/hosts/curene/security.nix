{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneSecurity = { config, ... }:
            {
                security.rtkit = {
                    enable = true;
                };
            };
    };
}
