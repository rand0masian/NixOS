{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneDbus = { config, ... }:
            {
                services.dbus = {
                    enable = true;
                };
            };
    };
}
