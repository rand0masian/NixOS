{ self, inputs, ... }:

{
    flake.homeModules = {
        chrome = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    google-chrome
                ];
            };
    };
}
