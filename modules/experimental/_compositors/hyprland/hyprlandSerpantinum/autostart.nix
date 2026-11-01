{ ... }:

{
    wayland.windowManager = {
        hyprland.extraLuaFiles = {
            autostart.content = ''
                hl.on("hyprland.start", function()
                    hl.exec_cmd("wl-paste --type text --watch cliphist store")
                    hl.exec_cmd("wl-paste --type image --watch cliphist store")
                    hl.exec_cmd("systemctl --user enable --now easyeffects")
                    hl.exec_cmd("sleep 1 && systemctl --user start hyprland-session.target")
                end)
            '';
        };
    };
}
