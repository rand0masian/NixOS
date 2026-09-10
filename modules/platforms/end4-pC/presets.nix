{ self, inputs, ... }:

{
    flake.homeModules = {
        presets = { config, pkgs, ... }:
            {
                home.file = {
                    ".config/hypr/presets".source = "${inputs.blapples-presets}/wallpapers";
                    ".config/hypr/wallpapers".source = "${inputs.blapples-presets}/wallpapers";
                };
            };
    };
}
