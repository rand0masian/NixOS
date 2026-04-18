{ self, inputs, ... }:

{
    flake.homeModules = {
        protonvpn = { config, pkgs, ... }:
            {
                home.packages = [
                    pkgs.protonvpn-gui
                ];
            };
    };
}
