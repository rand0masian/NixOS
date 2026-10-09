{ self, inputs, ... }:

{
    flake.homeModules = {
        blender = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    blender
                ];
            };
    };
}
