{ self, inputs, ... }:

{
    flake.homeModules = {
        noctalia = { config, ... }:
            {
                imports = [
                    inputs.noctalia.homeModules.default
                ];

                programs.noctalia-shell = {
                    enable = true;
                    settings = builtins.fromJSON (builtins.readFile ./noctalia.json);
                };
            };
    };
}
