{ self, inputs, ... }:

{
    flake.nixosModules = {
        settings = { config, ... }:
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
