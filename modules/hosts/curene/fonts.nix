{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneFonts = { config, pkgs, ... }:
            {
                fonts = {
                    fontconfig.enable = true;
                    packages = with pkgs; [
                        noto-fonts 
                        noto-fonts-cjk-sans 
                        noto-fonts-color-emoji
                    ];
                };
            };
    };
}
