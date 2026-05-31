{ self, inputs, ... }:

{
    flake.nixosModules = {
        security = { config, ... }:
            {
                security.rtkit = {
                    enable = true;
                };
            };
    };
}
