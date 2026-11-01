{ ... }:

{
    wayland.windowManager = {
        hyprland.extraLuaFiles = {
            env.content = ''
                hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
                hl.env("XDG_SESSION_TYPE", "wayland")
                hl.env("XDG_SESSION_DESKTOP", "Hyprland")
            '';
        };
    };
}
