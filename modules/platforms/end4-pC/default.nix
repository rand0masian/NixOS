{ self, inputs, ... }:

{
    flake.homeModules = {
        end4-pCPlatform = { config, ... }:
            {
                imports = [
                    self.homeModules.illogical-impulse
                ];
            };
    };
}
