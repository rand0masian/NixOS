{ self, inputs, ... }:

{
    flake.nixosModules = {
        end_4Home = { config, pkgs, ... }:
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
