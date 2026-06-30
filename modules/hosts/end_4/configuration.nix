{ self, inputs, ... }:

{
    flake.nixosModules = {
        end_4Configuration = { config, ... }:
            {
                imports = [
                    self.nixosModules.core
                    self.nixosModules.end_4Hardware
                    self.nixosModules.end_4Home
                    self.nixosModules.nvidia
                    self.nixosModules.sddm
                    self.nixosModules.ssh
                    self.nixosModules.steam
                    self.nixosModules.flatpak
                    self.nixosModules.fileExtraction
                    self.nixosModules.hyprland
                ];
            };
    };
}
