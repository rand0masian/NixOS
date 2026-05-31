{ self, inputs, ... }:

{
    flake.nixosModules = {
        stateVersion = { config, ... }:
            {
                system.stateVersion = "25.11";
            };
    };
}
