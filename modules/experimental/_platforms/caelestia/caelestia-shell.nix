{ experimental, config, lib, inputs, ... }:

{
    imports = [
        inputs.caelestia-shell.homeManagerModules.default
    ];

    config = lib.mkIf experimental {
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
}
