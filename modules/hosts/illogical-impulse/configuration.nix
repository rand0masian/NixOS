{ self, inputs, ... }:

{
    flake.nixosModules = {
        illogical-impulseConfiguration = { config, ... }:
            {
                imports = [
                    self.nixosModules.core
                    self.nixosModules.illogical-impulseHardware
                    self.nixosModules.illogical-impulseHome
                    self.nixosModules.nvidia
                    self.nixosModules.sddm
                    self.nixosModules.ssh
                    self.nixosModules.steam
                    self.nixosModules.flatpak
                    self.nixosModules.hyprland
                    self.nixosModules.geoclue2
                    self.nixosModules.fileCompression-Decompression
                ];
            };
    };
}
