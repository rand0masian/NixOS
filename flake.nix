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

        fastfetch-images-01 = {
            url = "https://wallpapers.com/images/high/cute-anime-profile-pictures-hf5vd8c7ywpbvgvf.webp";
            flake = false;
        };

        fastfetch-images-02 = {
            url = "https://i.pinimg.com/736x/6f/90/ea/6f90eacec65e50b2b2f07178bedf8dd9.jpg";
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

        pfp01 = {
            url = "https://novapicsly.com/wp-content/uploads/2026/01/dark-emo-pfp-glitch-effect-distorted-moody.webp";
            flake = false;
        };

        pfp02 = {
            url = "https://i.pinimg.com/236x/44/dd/39/44dd39521229bf5c43fdfc64ee62b412.jpg";
            flake = false;
        };

        pfp03 = {
            url = "https://i.pinimg.com/236x/f2/6b/cd/f26bcdef78bfe21c06f121e48d5f775b.jpg";
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
