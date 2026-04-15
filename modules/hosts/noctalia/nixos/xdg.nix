{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaXDG = { config, pkgs, ... }:
            {
                xdg.portal = {
                    enable = true;
                    extraPortals = [
                        pkgs.xdg-desktop-portal-gnome
                        pkgs.xdg-desktop-portal-gtk
                    ];

                    config.common = {
                        default = [
                            "gnome"
                            "gtk"
                        ];
                    };
                };
            };
    };
}
