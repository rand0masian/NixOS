{ ... }:

{
    wayland.windowManager = {
        hyprland.settings = {
            exec-once = [
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
                "systemctl --user enable --now easyeffects"
                "sleep 1 && systemctl --user start hyprland-session.target"
            ];
        };
    };
}
