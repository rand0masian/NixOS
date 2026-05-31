{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctalia = { config, pkgs, lib, ... }:
            {   
                imports = [
                    inputs.niri.homeModules.niri
                ];

                programs.niri = {
                    package = pkgs.niri;
                    settings = {
                        outputs = {
                            "DP-3" = {
                                mode = { width = 2560; height = 1440; };
                                position = { x = 0; y = 0; };
                            };

                            "DP-2" = {
                                mode = { width = 1920; height = 1080; };
                                position = { x = 2560; y = 0; };
                            };

                            "HDMI-A-1" = {
                                mode = { width = 1920; height = 1080; };
                                position = { x = 320; y = -1080; };
                            };
                        };

                        input.keyboard = {
                            xkb.layout = "gb";
                        };

                        environment = {
                            "DISPLAY" = ":0";
                        };

                        layer-rules = [
                            {
                                matches = [
                                    { namespace = "noctalia-shell"; }
                                ];
                            }
                        ];

                        overview = {
                            zoom = 0.3;
                            backdrop-color = "#28282B";
                        };

                        binds = {
                            "Mod+T".action.spawn-sh = lib.getExe pkgs.kitty;
                            "Mod+Q".action.close-window = {};
                            "Mod+Tab".action.toggle-overview = {};
                            "Mod+Right".action.focus-column-right = {};
                            "Mod+Left".action.focus-column-left = {};
                            "Mod+Up".action.focus-workspace-up = {};
                            "Mod+Down".action.focus-workspace-down = {};
                            "Mod+F".action.fullscreen-window = {};
                            "Mod+W".action.spawn = [ "zen-twilight" ];
                            "Mod+E".action.spawn = lib.getExe pkgs.kdePackages.dolphin;
                            "Mod+C".action.spawn-sh = lib.getExe pkgs.vscode;
                            "Mod+S".action.spawn = [ "spotify" ];
                            "Mod+D".action.spawn = [ "zen-twilight" "-P" "default" "--new-window" "https://discord.com/app" ];
                            "Mod+Space".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
                            "Mod+L".action.spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
                        };

                        spawn-at-startup = [
                            {
                                command = [ "noctalia-shell" ];
                            }

                            {
                                command = [ "sh" "-c" "Xwayland :0 & sleep 1 && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=niri" ];
                            }

                            {
                                command = [ "sh" "-c" "while ! busctl --user status org.gnome.Mutter.ScreenCast >/dev/null 2>&1; do sleep 0.2; done; pkill -f xdg-desktop-portal-gnome" ];
                            }
                        ];
                    };
                };
            };
    };
}
