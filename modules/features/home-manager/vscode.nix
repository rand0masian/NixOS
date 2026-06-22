{ self, inputs, ... }:

{
    flake.homeModules = {
        vscode = { config, pkgs, ... }:
            {
                home.packages = with pkgs; [
                    vscode
                ];
            };
    };
}
