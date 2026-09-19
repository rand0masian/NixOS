{ self, inputs, lib, ... }:

let 
    experimentalNixos = {
        calestiaHost = ./_hosts/caelestia/default.nix;
        open-webGui = ./_features/open-webgui.nix;
        ollama = ./_features/ollama.nix;
    };

    experimentalHome = {
        caelestiaPlatform = ./_platforms/caelestia/default.nix;
        symlinks.nix = ./_hosts/caelestia/symlinks.nix;
    };
in 
{
    flake.experimentalModules = {
        nixos = experimentalNixos;
        home = experimentalHome;
    };

    flake.nixosModules = {
        experimental = { ... }:
            {
                imports = [
                    ./options.nix
                ] ++ builtins.attrValues experimentalNixos;
            };
    };

    flake.homeModules = {
        experimental = { ... }:
            {
                imports = builtins.attrValues experimentalHome;
            };
    };
}
