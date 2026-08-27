{ self, inputs, ... }:

{
    flake.homeModules = {
        tor-browser = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    tor-browser
                ];
            };
    };
}
