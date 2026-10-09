{ experimental, config, lib, pkgs, ... }:

{
    config = lib.mkIf experimental {
        home.file = {
            "./wallpapers" = {
                source = "${pkgs.wallpapers}/share/wallpapers";
                recursive = true;
                force = true;
            };

            "./pfps" = {
                source = "${pkgs.pfps}/share/pfps";
                recursive = true;
                force = true;
            };
        };
    };
}
