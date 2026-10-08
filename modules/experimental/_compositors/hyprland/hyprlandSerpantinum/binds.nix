{ ... }:

{
    wayland.windowManager = {
        hyprland.settings = {
            "$mod" = "SUPER";
            "$terminal" = "kitty";

            gesture = [
                "3, horizontal, workspace"
            ];

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            binde = [
                "$mod SHIFT, left, resizeactive, -50 0"
                "$mod SHIFT, right, resizeactive, 50 0"
                "$mod SHIFT, up, resizeactive, 0 -50"
                "$mod SHIFT, down, resizeactive, 0 50"
            ];

            bindl = [
                ", XF86MonBrightnessDown, exec, serpantinum brightness lower"
                ", XF86MonBrightnessUp, exec, serpantinum brightness raise"

                ", Print, exec, serpantinum screenshot"
                "SHIFT, Print, exec, serpantinum screenshot --edit"
                "SUPER, Print, exec, serpantinum screenshot --full"
                "SUPER SHIFT, Print, exec, serpantinum screenshot --full --edit"

                ", XF86PowerOff, exec, serpantinum lock"

                "$mod, SPACE, exec, playerctl play-pause"
                ", XF86AudioPause, exec, playerctl play-pause"
                ", XF86AudioPlay, exec, playerctl play-pause"
                ", XF86AudioPrev, exec, playerctl previous"
                ", XF86AudioNext, exec, playerctl next"
                ", XF86AudioMicMute, exec, serpantinum volume mic-toggle"
                ", XF86AudioMute, exec, serpantinum volume mute-toggle"
            ];

            bindel = [
                "$mod, L, exec, serpantinum lock"
                ", XF86AudioLowerVolume, exec, serpantinum volume lower"
                ", XF86AudioRaiseVolume, exec, serpantinum volume raise"
            ];

            bind = [
                "$mod CTRL, left, movewindow, l"
                "$mod CTRL, right, movewindow, r"
                "$mod CTRL, up, movewindow, u"
                "$mod CTRL, down, movewindow, d"

                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                "$mod, Q, killactive"
                "$mod SHIFT, F, togglefloating"

                "$mod, W, exec, zen-twilight"
                "$mod, C, exec, codium"
                "$mod, E, exec, nautilus"
                "$mod, S, exec, spotify"
                "$mod, RETURN, exec, $terminal"

                "$mod, R, exec, serpantinum reload"
                "$mod SHIFT, C, exec, serpantinum msg toggle clipboard"
                "$mod, D, exec, serpantinum msg toggle launcher"
                "$mod, M, exec, serpantinum msg toggle music"
                "$mod, B, exec, serpantinum msg toggle system"
                "$mod SHIFT, W, exec, serpantinum msg toggle wallpaper"
                "$mod, N, exec, serpantinum msg toggle network"
                "$mod, V, exec, serpantinum msg toggle volume"
                "$mod, H, exec, serpantinum msg toggle guide"
                "$mod, A, exec, serpantinum msg toggle autohide"
            ] ++ builtins.concatLists (
                builtins.genList (
                    index:
                        let
                            workspace = index + 1;
                            key = if workspace == 10 then 0 else workspace;
                        in
                        [
                            "$mod, ${toString key}, exec, serpantinum msg workspace ${toString workspace}"
                            "$mod SHIFT, ${toString key}, exec, serpantinum msg workspace ${toString workspace} move"
                        ]
                ) 10
            );
        };
    };
}
