{ self, inputs, ... }:

{
    flake.homeModules = {
        fish = { config, ... }:
            {
                programs.fish = {
                    enable = true;
                };
            };
    };
}
