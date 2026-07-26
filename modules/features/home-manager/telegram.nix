{ self, inputs, ... }:

{
    flake.homeModules = {
        telegram = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    telegram-desktop
                ];
            };
    };
}
