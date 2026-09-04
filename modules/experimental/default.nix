{ self, inputs, lib, ... }:

let 
    experimentalNixos = {
        open-webGui = ./_features/open-webgui.nix;
        ollama = ./_features/ollama.nix;
    };

    experimentalHome = {};
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
