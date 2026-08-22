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
                    extraSpecialArgs = { inherit inputs; };
                    users.randomasian = {
                        imports = [
                            self.homeModules.zen-browser
                            self.homeModules.flatpak
                            self.homeModules.spicetify
                            self.homeModules.git
                            self.homeModules.protonvpn
                            self.homeModules.quickshell
                            self.homeModules.vscode
                            self.homeModules.kitty
                            self.homeModules.nautilus
                            self.homeModules.end4-pCPlatform
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
