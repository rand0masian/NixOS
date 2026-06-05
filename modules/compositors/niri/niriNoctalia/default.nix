{ self, inputs, ... }:

{
    flake.homeModules = {
        niriNoctaliaCompositor = { config, pkgs, ... }:
            {
                imports = [
                    inputs.niri.homeModules.niri
                    self.homeModules.niriNoctaliaMonitors
                    self.homeModules.niriNoctaliaInputs
                    self.homeModules.niriNoctaliaEnvironment
                    self.homeModules.niriNoctaliaLayerRules
                    self.homeModules.niriNoctaliaOverview
                    self.homeModules.niriNoctaliaBinds
                    self.homeModules.niriNoctaliaSpawnAtStartup
                ];

                programs.niri = {
                    package = pkgs.niri;
                };
            };
    };
}
