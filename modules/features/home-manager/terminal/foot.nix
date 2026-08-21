{ self, inputs, ... }:

{
    flake.homeModules = {
        foot = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    foot
                ];
            };
    };
}
