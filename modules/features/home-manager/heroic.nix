{ self, inputs, ... }:

{
    flake.homeModules = {
        heroic = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    heroic
                ];
            };
    };
}
