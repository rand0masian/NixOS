{ self, inputs, ... }:

{
    flake.homeModules = {
        nautilus = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    nautilus
                ];
            };
    };
}
