{ ... }:

{
    wayland.windowManager = {
        hyprland.extraLuaFiles = {
            settings.content = ''
                hl.config({
                    general = {
                        border_size = 0,
                        gaps_in = 4,
                        gaps_out = 6,
                        float_gaps = 6,
                        resize_on_border = true,
                        extend_border_grab_area = 30,
                    },

                    decoration = {
                        rounding = 12,
                        active_opacity = 1.0,
                        inactive_opacity = 1.0,
                        blur = {
                            enabled = true,
                            size = 8,
                            passes = 2,
                            new_optimizations = true,
                        },

                        shadow = {
                            enabled = false,
                        },
                    },

                    input = {
                        kb_layout = "gb",
                        kb_options = "grp:alt_shift_toggle",
                        accel_profile = "flat",
                        touchpad = {
                            natural_scroll = true,
                            disable_while_typing = false,
                        },
                    },

                    misc = {
                        focus_on_activate = false,
                        font_family = "Maple Mono",
                        disable_hyprland_logo = true,
                        disable_splash_rendering = true,
                    },
                })

                hl.curve("myBezier", {
                    type = "bezier",
                    points = {
                        { 0.05, 0.9 },
                        { 0.1, 1.05 },
                    },
                })

                local animations = {
                    {
                        leaf = "windows",
                        style = "popin 80%",
                    },

                    {
                        leaf = "windowsOut",
                        style = "popin 80%",
                    },
                            
                    {
                        leaf = "layers",
                        style = "fade",
                    },
                            
                    {
                        leaf = "layersIn",
                        style = "fade",
                    },

                    {
                        leaf = "layersOut",
                        style = "fade",
                    },

                    {
                        leaf = "fade",
                    },

                    {
                        leaf = "workspaces",
                        style = "slide",
                    },

                    {
                        leaf = "specialWorkspaceIn",
                        style = "fade",
                    },

                    {
                        leaf = "specialWorkspaceOut",
                        style = "fade",
                    },
                }

                for _, animation in ipairs(animations) do
                    hl.animation({
                        leaf = animation.leaf,
                        enabled = true,
                        speed = 5,
                        bezier = "myBezier",
                        style = animation.style,
                    })
                end
            '';
        };
    };
}
