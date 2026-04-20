{ self, inputs, ... }:

{
    flake.homeModules = {
        quickshell = { config, pkgs, ... }:
            {
                home.packages = [
                    pkgs.quickshell
                ];
            };
    };
}
