{ self, inputs, ... }:

{
    flake.nixosModules = {
        illogical-impulseHome = { config, pkgs, ... }:
            {
                imports = [
                    inputs.home-manager.nixosModules.home-manager
                ];

                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = {
                        inherit inputs;
                        experimental = config.features.experimental.enable;
                    };
                    
                    users.randomasian = {
                        imports = [
                            self.homeModules.illogical-impulseHomeSymlinks
                            self.homeModules.zen-browser
                            self.homeModules.flatpak
                            self.homeModules.spicetify
                            self.homeModules.git
                            self.homeModules.protonvpn
                            self.homeModules.vscode
                            self.homeModules.kitty
                            self.homeModules.nautilus
                            self.homeModules.tor-browser
                            self.homeModules.qbittorrent
                            self.homeModules.dolphin
                            self.homeModules.end4-pCPlatform
                            self.homeModules.experimental
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
            };
    };
}
