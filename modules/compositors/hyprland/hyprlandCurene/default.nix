{ self, inputs, ... }:

{
    flake.homeModules = {
        hyprlandCureneCompositor = { config, pkgs, ... }:
            {
                imports = [
                    self.homeModules.hyprlandCureneMonitors
                ];

                wayland.windowManager = {
                    hyprland.enable = true;
                };
            };
    };
}
