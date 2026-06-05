{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaLayerRules = { config, ... }:
            {
                programs.niri = {
                    settings.layer-rules = [
                        {
                            matches = [
                                { namespace = "noctalia-shell"; }
                            ];
                        }
                    ];
                };
            };
    };
}
