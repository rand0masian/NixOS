{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaFlatpak = { config, ... }:
            {
                services.flatpak = {
                    enable = true;
                };
            };
    };
}
