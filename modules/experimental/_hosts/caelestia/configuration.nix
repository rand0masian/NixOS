{ config, self, inputs, ... }:

{
    imports = [
        self.nixosModules.core
        self.nixosModules.nvidia
        self.nixosModules.sddm
        self.nixosModules.ssh
        self.nixosModules.steam
        self.nixosModules.flatpak
        self.nixosModules.hyprland
        self.nixosModules.fileCompression-Decompression
        
        ./hardware.nix
        ./home.nix
    ];
}
