{ self, inputs, ... }:

{
    flake.homeModules = {
        hyprlandEnd4-pCCompositor = { config, ... }:
            {
                imports = [];

                wayland.windowManager = {
                    hyprland.enable = true;
                };
            };
    };
}
