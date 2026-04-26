{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneX11wayland = { config, pkgs, ... }:
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
