{ self, inputs, ... }:

{
    flake.nixosModules = {
        cureneSettings = { config, ... }:
            {
                nix.settings = {
                    experimental-features = [
                        "nix-command"
                        "flakes"
                    ];
                };
            };
    };
}
