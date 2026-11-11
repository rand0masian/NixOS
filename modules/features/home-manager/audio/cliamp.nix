{ self, inputs, ... }:

{
    flake.homeModules = {
        cliamp = { pkgs, ... }:
            {
                home.packages = with pkgs; [
                    cliamp
                ];
            };
    };
}
