{ self, inputs, ... }:

{
    flake.homeModules = {
        illogical-impulse = { config, ... }:
            {
                imports = [
                    inputs.illogical-impulse.homeManagerModules.default
                ];

                programs.illogical-impulse = {
                    enable = true;
                };
            };
    };
}
