{ self, inputs, ... }:

{
    flake.homeModules = {
        noctalia = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    noctalia
                ];

                xdg.configFile = {
                    "noctalia/config.toml".source = ./noctalia.toml;
                };
            };
    };
}
