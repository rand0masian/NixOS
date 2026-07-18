{ self, inputs, ... }:

{
    flake.homeModules = {
        kitty = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    kitty
                ];
            };
    };
}
