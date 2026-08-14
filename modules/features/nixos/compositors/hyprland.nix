{ self, inputs, ... }:

{
    flake.nixosModules = {
        hyprland = { config, ... }:
            {
                programs.hyprland = {
                    enable = true;
                    withUWSM = false;
                };
            };
    };
}
