{ self, inputs, ... }:

{
    flake.homeModules = {
        dolphin = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    kdePackages.dolphin
                ];
            };
    };
}
