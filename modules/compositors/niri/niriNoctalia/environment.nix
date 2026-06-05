{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaEnvironment = { config, ... }:
            {
                programs.niri = {
                    settings.environment = {
                        "DISPLAY" = ":0";
                    };
                };
            };
    };
}
