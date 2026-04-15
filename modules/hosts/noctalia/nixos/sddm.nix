{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaSDDM = { config, ... }:
            {
                services.displayManager = {
                    sddm = {
                        enable = true;
                        wayland.enable = true;
                    };
                };
            };
    };
}
