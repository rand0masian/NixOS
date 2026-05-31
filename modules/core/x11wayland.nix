{ self, inputs, ... }:

{
    flake.nixosModules = {
        x11Wayland = { config, pkgs, ... }:
            {
                programs.xwayland = {
                    enable = true;
                };

                environment.systemPackages = with pkgs; [
                    xwayland-satellite
                ];
            };
    };
}
