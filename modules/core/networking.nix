{ self, inputs, ... }:

{
    flake.nixosModules = {
        networking = { config, ... }:
            {
                networking = {
                    hostName = "nixos-home-personal";
                    networkmanager.enable = true;
                    wireless.enable = true;
                };
            };
    };
}
