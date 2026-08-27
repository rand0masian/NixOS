{ self, inputs, ... }:

{
    flake.overlays = {
        gnome-adwaita = (final: prev: {
            gnome-icon-theme = prev.adwaita-icon-theme;
        });
    };

    perSystem = { config, system, ... }:
        {
            _module.args = {
                pkgs = import inputs.nixpkgs {
                    inherit system;
                    overlays = [
                        self.overlays.gnome-adwaita
                    ];

                    config.allowUnfree = true;
                };
            };

            packages.gnome-adwaita = config._module.args.pkgs.gnome-icon-theme;
        };
}
