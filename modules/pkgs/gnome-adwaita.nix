{ self, inputs, ... }:

{
    flake.overlays = {
        gnome-adwaita = (final: prev: {
            gnome-icon-theme = prev.adwaita-icon-theme;
        });
    };

    perSystem = { config, pkgs, ... }:
        {
            packages.gnome-adwaita = pkgs.gnome-icon-theme;
        };
}
