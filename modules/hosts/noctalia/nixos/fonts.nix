{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaFonts = { config, pkgs, ... }:
            {
                fonts.fontconfig = {
                    enable = true;
                };

                fonts.packages = with pkgs; [
                    noto-fonts
                    noto-fonts-cjk-sans
                    noto-fonts-color-emoji
                ];
            };
    };
}
