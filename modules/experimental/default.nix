{ self, inputs, lib, ... }:

let 
    caelestiaHost = ./_hosts/caelestia/default.nix;

    experimentalNixos = {
        open-webGui = ./_features/open-webgui.nix;
        ollama = ./_features/ollama.nix;
    };

    experimentalHome = {
        caelestiaPlatform = ./_platforms/caelestia/default.nix;
        symlinks.nix = ./_hosts/caelestia/symlinks.nix;
    };
in 
{
    imports = [
        caelestiaHost
    ];

    flake.experimentalModules = {
        nixos = experimentalNixos // { inherit caelestiaHost; };
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
