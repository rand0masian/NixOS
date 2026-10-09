{ self, inputs, lib, ... }:

let 
    caelestiaHost = ./_hosts/caelestia/default.nix;
    serpantinumHost = ./_hosts/serpantinum/default.nix;

    experimentalNixos = {
        open-webui = ./_features/open-webui.nix;
        ollama = ./_features/ollama.nix;
    };

    experimentalHome = {
        caelestiaPlatform = ./_platforms/caelestia/default.nix;
        serpantinumPlatform = ./_platforms/serpantinum/home-manager/default.nix;
        hyprlandSerpantinumCompositor = ./_compositors/hyprland/hyprlandSerpantinum/default.nix;
        caelestiaHomeSymlinks = ./_hosts/caelestia/symlinks.nix;
        serpantinumHomeSymlinks = ./_hosts/serpantinum/symlinks.nix;
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
            nixos = experimentalNixos // {
                inherit caelestiaHost serpantinumHost;
                serpantinumPlatform = ./_platforms/serpantinum/nixos/default.nix;
            };

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
    };
}
