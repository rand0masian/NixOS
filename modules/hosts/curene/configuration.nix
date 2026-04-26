{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneConfiguration = { config, ... }:
            {
                imports = [
                    self.nixosModules.cureneBootloader
                    self.nixosModules.cureneHardware
                    self.nixosModules.cureneUsers
                    self.nixosModules.cureneTimezone
                    self.nixosModules.cureneI18n
                    self.nixosModules.cureneKeymap
                    self.nixosModules.cureneNetworking
                    self.nixosModules.curenePipewire
                    self.nixosModules.cureneAllowunfree
                    self.nixosModules.cureneSettings
                    self.nixosModules.cureneXserver
                    self.nixosModules.cureneStateversion
                    self.nixosModules.nvidia
                    self.nixosModules.sddm
                    self.nixosModules.ssh
                    self.nixosModules.steam
                    self.nixosModules.flatpak
                    self.nixosModules.fileExtraction
                    self.nixosModules.cureneX11wayland
                    self.nixosModules.cureneFonts
                    self.nixosModules.cureneDbus
                    self.nixosModules.curenePaths
                    self.nixosModules.cureneXDG
                    self.nixosModules.hyprland
                ];
            };
    };
}
