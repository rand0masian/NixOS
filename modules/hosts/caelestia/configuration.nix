{ self, inputs, ... }:

{
    flake.nixosModules = {
        caelestiaConfiguration = { config, ... }:
            {
                imports = [
                    self.nixosModules.core
                    self.nixosModules.caelestiaHardware
                    self.nixosModules.caelestiaHome
                    self.nixosModules.nvidia
                    self.nixosModules.sddm
                    self.nixosModules.ssh
                    self.nixosModules.steam
                    self.nixosModules.flatpak
                    self.nixosModules.hyprland
                    self.nixosModules.fileCompression-Decompression
                ];
            };
    };
}
