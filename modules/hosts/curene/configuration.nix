{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneConfiguration = { config, ... }:
            {
                imports = [
                    self.nixosModules.core
                    self.nixosModules.cureneHardware
                    self.nixosModules.cureneHome
                    self.nixosModules.nvidia
                    self.nixosModules.sddm
                    self.nixosModules.ssh
                    self.nixosModules.steam
                    self.nixosModules.flatpak
                    self.nixosModules.fileCompression-Decompression
                    self.nixosModules.hyprland
                ];
            };
    };
}
