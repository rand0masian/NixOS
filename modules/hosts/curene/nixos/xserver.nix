{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneXserver = { config, ... }:
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
