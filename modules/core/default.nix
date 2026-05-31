{ self, inputs, ... }:

{
    flake.nixosModules = {
        core = { config, ... }:
            {
                imports = [
                    self.nixosModules.locale 
                    self.nixosModules.bootLoader 
                    self.nixosModules.stateVersion
                    self.nixosModules.keyMap 
                    self.nixosModules.dbus 
                    self.nixosModules.users 
                    self.nixosModules.settings 
                    self.nixosModules.security
                    self.nixosModules.networking
                    self.nixosModules.allowUnfree
                    self.nixosModules.pipewire
                    self.nixosModules.fonts
                    self.nixosModules.paths
                    self.nixosModules.x11Wayland
                    self.nixosModules.xdg
                    self.nixosModules.xServer 
                ];
            };
    };
}
