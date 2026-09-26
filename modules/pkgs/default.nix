{ self, inputs, ... }:

{
    perSystem = { system, ... }:
        {
            _module.args = {
                pkgs = import inputs.nixpkgs {
                    inherit system;
                    overlays = [
                        self.overlays.gnome-adwaita
                        self.overlays.neo-zen
                        self.overlays.pfps
                        self.overlays.wallpapers
                    ];

                    config.allowUnfree = true;
                };
            };
        };
}
