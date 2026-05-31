{ self, inputs, ... }:

{
    flake.nixosModules = {
        xServer = { config, ...}:
            {
                services.xserver = {
                    enable = true;
                    videoDrivers = [
                        "nvidia"
                    ];

                    xkb = {
                        layout = "gb";
                        variant = "";
                    };
                };
            };
    };
}
