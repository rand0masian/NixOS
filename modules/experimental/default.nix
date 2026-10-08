{ self, inputs, lib, ... }:

let 
    caelestiaHost = ./_hosts/caelestia/default.nix;
    serpantinumHost = ./_hosts/serpantinum/default.nix;

    experimentalNixos = {
        serpantinumPlatform = ./_platforms/serpantinum/nixos/default.nix;
        open-webui = ./_features/open-webui.nix;
        ollama = ./_features/ollama.nix;
    };

    experimentalHome = {
        caelestiaPlatform = ./_platforms/caelestia/default.nix;
        serpantinumPlatform = ./_platforms/serpantinum/home-manager/default.nix;
        hyprlandSerpantinumCompositor = ./_compositors/hyprland/hyprlandSerpantinum/default.nix;
        caelestiaHomeSymlinks = ./_hosts/caelestia/symlinks.nix;
    };

    experimentalOverlays = {
        ollama-cuda = import ./_pkgs/ollama-cuda.nix { inherit inputs; };
    };
in 
{
    imports = [
        caelestiaHost
        serpantinumHost
    ];

    flake = {
        experimentalModules = {
            nixos = experimentalNixos // { inherit caelestiaHost serpantinumHost; };
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
