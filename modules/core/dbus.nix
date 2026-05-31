{ self, inputs, ... }:

{
    flake.nixosModules = {
        dbus = { config, ... }:
            {
                services.dbus = {
                    enable = true;
                };
            };
    };
}
