{ self, inputs, ... }:

{
    flake.homeModules = {
        discordchatexporter = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    discordchatexporter-desktop
                ];
            };
    };
}
