{ config, pkgs, self, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
            inherit inputs;
            experimental = config.features.experimental.enable;
        };

        users.randomasian = {
            imports = [
                self.homeModules.zen-browser
                self.homeModules.flatpak
                self.homeModules.spicetify
                self.homeModules.git
                self.homeModules.protonvpn
                self.homeModules.vscodium
                self.homeModules.kitty
                self.homeModules.nautilus
                self.homeModules.tor-browser
                self.homeModules.qbittorrent
                self.homeModules.dolphin
                self.homeModules.protonup-qt
                self.homeModules.handbrake
                self.homeModules.fish
                self.homeModules.starship
                self.homeModules.experimental

                ../../platforms/caelestia/default.nix
            ];

            programs.home-manager = {
                enable = true;
            };

            home = {
                username = "randomasian";
                homeDirectory = "/home/randomasian";
                stateVersion = "25.11";
            };
        };
    };
}
