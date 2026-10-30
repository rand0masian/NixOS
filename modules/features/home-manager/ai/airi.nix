{ self, inputs, ... }:

{
    flake.homeModules = {
        airi = { pkgs, ... }:
            {
                home.packages = with pkgs; [
                    inputs.airi.packages.${pkgs.system}.default
                ];
            };
    };
}
