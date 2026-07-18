{ self, inputs, ... }:

{
    flake.homeModules = {
        hyprlandCureneCompositor = { config, pkgs, ... }:
            {
                imports = [
                    self.homeModules.hyprlandCureneMonitors
                    self.homeModules.hyprlandCureneBinds
                ];

                wayland.windowManager = {
                    hyprland.enable = true;
                };
            };
    };
}
