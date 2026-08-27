{ self, inputs, ... }:

{
    flake.homeModules = {
        renpy = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    renpy
                ];
            };
    };
}
