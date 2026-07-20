{ self, inputs, ... }:

{
    flake.nixosModules = {
        firmware = { config, ... }:
            {
                hardware.enableAllFirmware = true;
            };
    };
}
