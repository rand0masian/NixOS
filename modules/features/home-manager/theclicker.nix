{ self, inputs, ... }:

{
    flake.homeModules = {
        theClicker = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    theclicker
                ];
            };
    };
}
