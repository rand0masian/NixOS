{ self, inputs, lib, ... }:

let 
    caelestiaHost = ./_hosts/caelestia/default.nix;

    experimentalNixos = {
        open-webui = ./_features/open-webui.nix;
        ollama = ./_features/ollama.nix;
    };

    experimentalHome = {
        caelestiaPlatform = ./_platforms/caelestia/default.nix;
        symlinks.nix = ./_hosts/caelestia/symlinks.nix;
    };

    experimentalOverlays = {
        ollama-cuda = import ./_pkgs/ollama-cuda.nix { inherit inputs; };
    };
in 
{
    imports = [
        caelestiaHost
    ];

    flake = {
        experimentalModules = {
            nixos = experimentalNixos // { inherit caelestiaHost; };
            home = experimentalHome;
            overlays = experimentalOverlays;
        };

        nixosModules.experimental = { ... }:
            {
                imports = [
                    ./options.nix
                    ./_overlays.nix
                ] ++ builtins.attrValues experimentalNixos;
            };
        
        homeModules.experimental = { ... }:
            {
                imports = builtins.attrValues experimentalHome;
            };
    };
}
