{ self, inputs, ... }:

{
    flake.homeModules = {
        noctaliaCompositor = { config, ... }:
            {
                imports = [
                    self.homeModules.niriNoctalia
                ];
            };
    };
}
