{ self, inputs, ... }:

{
    flake.nixosModules = {
        experimentalFeatures = { config, ... }:
            {
                imports = [
                    self.nixosModules.experimental
                ];

                features.experimental = {
                    enable = true;
                };
            };
    };
}
