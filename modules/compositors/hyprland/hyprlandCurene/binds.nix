{ self, inputs, ... }:

{
    flake.homeModules = {
        hyprlandCureneBinds = { config, ... }:
            {
                wayland.windowManager = {
                    hyprland.settings = {
                        "$mod" = "SUPER";
                        bind = [
                            "$mod, T, exec, kitty"
                            "$mod, C, exec, vscode"
                            "$mod, W, exec, zen-twilight"
                            "$mod, E, exec, nautilus"
                            "$mod, S, exec, spotify"
                        ];
                    };
                };
            };
    };
}
