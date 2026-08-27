{ self, inputs, ... }:

{
    flake.homeModules = {
        pavucontrol = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    pavucontrol
                ];
            };
    };
}
