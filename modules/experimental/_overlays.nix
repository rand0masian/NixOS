{ config, lib, self, ... }:

{
    nixpkgs.overlays = lib.optionals config.features.experimental.enable (
        builtins.attrValues self.experimentalModules.overlays
    );
}
