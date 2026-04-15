{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaDbus = { config, ... }:
            {
                services.dbus = {
                    enable = true;
                };
            };
    };
}
