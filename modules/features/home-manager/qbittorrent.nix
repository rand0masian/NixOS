{ self, inputs, ... }:

{
    flake.homeModules = {
        qbittorrent = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    qbittorrent
                ];
            };
    };
}
