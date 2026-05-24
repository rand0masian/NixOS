{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaXDG = { config, pkgs, ... }:
            {
                xdg.portal = {
                    enable = true;
                    extraPortals = with pkgs; [
                        xdg-desktop-portal-gnome
                        xdg-desktop-portal-gtk
                    ];

                    config.common = {
                        "org.freedesktop.impl.portal.ScreenCast" = [
                            "gnome"
                        ];

                        "org.freedesktop.impl.portal.Screenshot" = [
                            "gnome"
                        ];

                        default = [
                            "gnome"
                            "gtk"
                        ];
                    };
                };
            };
    };
}
