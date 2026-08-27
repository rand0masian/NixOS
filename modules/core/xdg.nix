{ self, inputs, ... }:

{
    flake.nixosModules = {
        xdg = { config, pkgs, ... }:
            {
                xdg.portal = {
                    enable = true;
                    extraPortals = with pkgs; [
                        xdg-desktop-portal-gnome
                        xdg-desktop-portal-gtk
                        xdg-desktop-portal-hyprland
                    ];

                    config.common = {
                        default = [
                            "gnome"
                            "gtk"
                            "hyprland"
                        ];
                    };
                };
            };
    };
}
