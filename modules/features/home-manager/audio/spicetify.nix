{ self, inputs, ... }:

{
    flake.homeModules = {
        spicetify = { config, pkgs, ... }:
            {
                imports = [
                    inputs.spicetify-nix.homeManagerModules.default
                ];

                programs.spicetify = let
                    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
                in 
                    {
                        enable = true;
                        enabledExtensions = with spicePkgs.extensions; [
                            adblock
                            hidePodcasts
                        ];
                        enabledCustomApps = with spicePkgs.apps; [
                            ncsVisualizer
                        ];
                        theme = spicePkgs.themes.retroBlur;
                    };
            };
    };
}
