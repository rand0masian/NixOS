{ self, inputs, ... }:

{
    flake.homeModules = {
        handbrake = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    handbrake
                ];
            };
    };
}
