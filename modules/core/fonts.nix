{ self, inputs, ... }:

{
    flake.nixosModules = {
        fonts = { config, pkgs, ... }:
            {
                fonts = {
                    fontconfig.enable = true;
                    fontDir.enable = true;
                    packages = with pkgs; [
                        noto-fonts 
                        noto-fonts-cjk-sans 
                        noto-fonts-color-emoji
                        rubik
                        nerd-fonts.ubuntu
                        nerd-fonts.jetbrains-mono
                        maple-mono.truetype
                    ];
                };
            };
    };
}
