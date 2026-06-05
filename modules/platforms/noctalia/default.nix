{ self, inputs, ... }:

{
    flake.homeModules = {
        noctaliaPlatform = { config, pkgs, lib, ... }:
            {
                imports = [
                    self.homeModules.noctalia
                    self.homeModules.niriNoctaliaCompositor
                ];
            };
    };
}
