{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneStateversion = { config, ... }:
            {
                system.stateVersion = "25.11";
            };
    };
}
