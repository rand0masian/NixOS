{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaElectron = { config, ... }:
            {
                environment.sessionVariables = {
                    NIRI_DISABLE_DMA_BUF = "1";
                    NIXOS_OZONE_WL = "1";
                    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
                };
            };
    };
}
