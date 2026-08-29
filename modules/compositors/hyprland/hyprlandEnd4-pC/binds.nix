{ self, inputs, ... }:

{
    flake.homeModules = {
        hyprlandEnd4-pCBinds = { config, ... }:
            {
                wayland.windowManager = {
                    hyprland.settings = {
                        "$mod" = "SUPER";
                        bind = [
                            "$mod, T, exec, foot"
                            "$mod, W, exec, zen-twilight"
                            "$mod, C, exec, code"
                            "$mod, E, exec, nautilus"
                            "$mod, S, exec, spotify"
                        ];
                    };
                };
            };
    };
}
