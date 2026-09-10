{ self, inputs, ... }:

{
    flake.homeModules = {
        protonup-qt = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    protonup-qt
                ];
            };
    };
}
