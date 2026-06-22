{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaHome = { config, pkgs, ... }:
            {
                imports = [
                    inputs.home-manager.nixosModules.home-manager
                ];

                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = { inherit inputs; };
                    users.randomasian = {
                        imports = [
                            self.homeModules.noctaliaHomeSymlinks
                            self.homeModules.noctaliaPlatform
                            self.homeModules.zen-browser
                            self.homeModules.flatpak
                            self.homeModules.spicetify
                            self.homeModules.git
                            self.homeModules.protonvpn
                            self.homeModules.quickshell
                            self.homeModules.audacity
                            self.homeModules.pavucontrol
                            self.homeModules.qbittorrent
                            self.homeModules.heroic
                            self.homeModules.chrome
                            self.homeModules.theClicker
                            self.homeModules.tor-browser
                        ];

                        programs.home-manager = {
                            enable = true;
                        };

                        home.username = "randomasian";
                        home.homeDirectory = "/home/randomasian";
                        home.stateVersion = "25.11";
                    };
                };
            };
    };
}
