{ self, inputs, ... }:

{
    flake.homeModules = {
        end4-pCPlatform = { config, ... }:
            {
                imports = [
                    self.homeModules.illogical-impulse
                    self.homeModules.end4-pC
                ];
            };
    };
}
