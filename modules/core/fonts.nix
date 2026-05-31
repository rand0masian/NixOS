{ self, inputs, ... }:

{
    flake.nixosModules = {
        fonts = { config, pkgs, ... }:
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
