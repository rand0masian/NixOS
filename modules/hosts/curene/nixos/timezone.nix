{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneTimezone = { config, ... }:
            {
                time.timeZone = "Europe/London";
            };
    };
}
