{ self, inputs, ... }:

{
    flake.homeModules = {
        hyprlandCureneMonitors = { config, ... }:
            {
                wayland.windowManager = {
                    hyprland.settings = {
                        monitor = [
                            "DP-3,2560x1440@179.959,0x0,1"
                            "DP-2,1920x1080@74.973,2560x0,1"
                            "HDMI-A-1,1920x1080@143.981,320x-1080,1"
                        ];
                    };
                };
            };
    };
}
