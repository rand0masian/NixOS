{ self, inputs, ... }:

{
    flake.homeModules = {
        quickshell = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    quickshell
                ];
            };
    };
}
