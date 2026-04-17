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
                        source = "${pkgs.pfps}/share/pfps";
                        recursive = true;
                        force = true;
                    };
                };
            };
    };
}
