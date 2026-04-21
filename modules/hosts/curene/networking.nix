{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneNetworking = { config, ... }:
            {
                networking = {
                    hostName = "nixos-home-personal";
                    networkmanager.enable = true;
                    wireless.enable = true;
                };
            };
    };
}
