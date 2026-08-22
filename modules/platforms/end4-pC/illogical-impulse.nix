{ self, inputs, ... }:

{
    flake.homeModules = {
        illogical-impulse = { config, ... }:
            {
                programs.illogical-impulse = {
                    enable = true;
                };
            };
    };
}
