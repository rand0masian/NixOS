{ experimental, config, inputs, ... }:

{
    imports = [
        inputs.caelestia-shell.homeManagerModule.default
    ];

    programs.calestia = {
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
}
