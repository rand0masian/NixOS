{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaSpawnAtStartup = { config, ... }:
            {
                programs.niri = {
                    settings.spawn-at-startup = [
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
}
