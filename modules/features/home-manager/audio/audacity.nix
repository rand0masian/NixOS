{ self, inputs, ... }:

{
    flake.homeModules = {
        audacity = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    audacity
                ];
            };
    };
}
