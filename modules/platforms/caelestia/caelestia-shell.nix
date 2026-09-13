{ self, inputs, ... }:

{
    flake.homeModules = {
        caelestia-shell = { config, ... }:
            {
                imports = [
                    inputs.caelestia-shell.homeManagerModules.default
                ];

                programs.caelestia = {
                    enable = true;
                    settings = {
                        bar.statusIcons = [
                            { id = "lockStatus"; enabled = true; }
                            { id = "network"; enabled = true; }
                        ];

                        paths.wallpaperDir = "~/wallpapers";
                    };

                    cli = {
                        enable = true;
                        settings.theme = {
                            enableGtk = false;
                        };
                    };
                };
            };
    };
}
