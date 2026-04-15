{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaX11wayland = { config, pkgs, ... }:
            {
                programs.xwayland = {
                    enable = true;
                };

                services.xserver = {
                    enable = true;
                    videoDrivers = [
                        "nvidia"
                    ];
                };

                environment.systemPackages = with pkgs; [
                    xwayland-satellite
                ];
            };
    };
}
