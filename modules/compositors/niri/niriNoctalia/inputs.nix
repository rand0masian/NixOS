{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaInputs = { config, ... }:
            {  
                programs.niri = {
                    settings.input = {
                        keyboard.xkb = {
                            layout = "gb";
                        };
                    };
                };
            };
    };
}
