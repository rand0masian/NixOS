{ self, inputs, ... }:

{
    flake.nixosModules = {
        systemFlatpak = { config, ... }:
            {
                services.flatpak = {
                    enable = true;
                };
            };
    };
}
