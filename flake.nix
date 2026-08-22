{
    inputs = {
        nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };

        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        wallpapers = {
            url = "github:krishna4a6av/Wallpapers";
            flake = false;
        };

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake/main";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };

        neo-zen = {
            url = "github:JustVibingWhileCoding/Neo-Zen/main";
            flake = false;
        };

        PINCE = {
            url = "https://github.com/korcankaraokcu/PINCE/releases/download/v0.5/PINCE-x86_64.AppImage";
            flake = false;
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };

        agenix = {
            url = "github:ryantm/agenix";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };

        quickshell = {
            url = "github:quickshell-mirror/quickshell";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };

        illogical-impulse = {
            url = "github:soymou/illogical-flake";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                dotfiles.follows = "end4-pC";
            };
        };

        end4-pC = {
            url = "github:pctrade/end4-pC";
            flake = false;
        };

        niri.url = "github:sodiboo/niri-flake";
        flake-parts.url = "github:hercules-ci/flake-parts";
        nix-wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
        import-tree.url = "github:vic/import-tree";
    };

    outputs = inputs@{ flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; }
            {
                systems = [
                    "x86_64-linux"
                ];

                imports = [
                    (inputs.import-tree ./modules)
                ];
            };
}
