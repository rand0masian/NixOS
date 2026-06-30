{ self, inputs, ... }:

{
    flake.homeModules = {
        noctaliaHomeSymlinks = { config, pkgs, ... }:
            {
                home.file = {
                    "./wallpapers" = {
                        source = "${pkgs.wallpapers}/share/wallpapers";
                        recursive = true;
                        force = true;
                    };

                    "./pfps" = {
                        source = ../../../assets/pfps;
                        recursive = true;
                        force = true;
                    };
                };
            };
    };
}
