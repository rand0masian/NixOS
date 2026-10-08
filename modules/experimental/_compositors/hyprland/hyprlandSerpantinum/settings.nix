{ ... }:

{
    wayland.windowManager = {
        hyprland.settings = {
            general = {
                border_size = 0;
                gaps_in = 4;
                gaps_out = 6;
                float_gaps = 6;
                resize_on_border = true;
                extend_border_grab_area = 30;
            };

            decoration = {
                rounding = 12;
                active_opacity = 1.0;
                inactive_opacity = 1.0;

                blur = {
                    enabled = true;
                    size = 8;
                    passes = 2;
                    new_optimizations = true;
                };

                shadow = {
                    enabled = false;
                };
            };

            input = {
                kb_layout = "us";
                kb_options = "grp:alt_shift_toggle";
                accel_profile = "flat";

                touchpad = {
                    natural_scroll = true;
                    disable_while_typing = false;
                };
            };

            misc = {
                focus_on_activate = false;
                font_family = "JetBrains Mono";
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
            };

            bezier = [
                "myBezier, 0.05, 0.9, 0.1, 1.05"
            ];

            animation = [
                "windows, 1, 5, myBezier, popin 80%"
                "windowsOut, 1, 5, myBezier, popin 80%"
                "layers, 1, 5, myBezier, fade"
                "layersIn, 1, 5, myBezier, fade"
                "layersOut, 1, 5, myBezier, fade"
                "fade, 1, 5, myBezier"
                "workspaces, 1, 5, myBezier, slide"
                "specialWorkspaceIn, 1, 5, myBezier, fade"
                "specialWorkspaceOut, 1, 5, myBezier, fade"
            ];
        };
    };
}
