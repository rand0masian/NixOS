{ self, inputs, ... }:

{
    flake.homeModules = {
        wl-mirror = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    wl-mirror
                ];
            };
    };
}
