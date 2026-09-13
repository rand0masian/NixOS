{ self, inputs, ... }:

{
    flake.homeModules = {
        caelestiaPlatform = { config, ... }:
            {
                imports = [
                    self.homeModules.caelestia-shell
                ];
            };
    };
}
